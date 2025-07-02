/*******************************************************************************
  XDMAC PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_xdmac0.c

  Summary:
    XDMAC PLIB Implementation File

  Description:
    None

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2023 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

#include "device.h"
#include "plib_xdmac0.h"
#include "interrupts.h"
#include "safe_peripheral/common/plib_common.h"
/* Macro for limiting XDMAC objects to highest channel enabled */
#define XDMAC_ACTIVE_CHANNELS_MAX (0U)


typedef struct
{
    uint8_t                inUse;
    XDMAC_CHANNEL_CALLBACK callback;
    uintptr_t              context;
    uint8_t                busyStatus;
} XDMAC_CH_OBJECT ;

static XDMAC_CH_OBJECT xdmacChannelObj[XDMAC_ACTIVE_CHANNELS_MAX];

// *****************************************************************************
// *****************************************************************************
// Section: XDMAC Implementation
// *****************************************************************************
// *****************************************************************************

void XDMAC0_Initialize( void )
{
    XDMAC_CH_OBJECT *xdmacChObj = (XDMAC_CH_OBJECT *)&xdmacChannelObj[0];
    uint8_t channel = 0U;

    /* Initialize channel objects */
    for(channel = 0U; channel < XDMAC_ACTIVE_CHANNELS_MAX; channel++)
    {
        xdmacChObj->inUse = 0U;
        xdmacChObj->callback = NULL;
        xdmacChObj->context = 0U;
        xdmacChObj->busyStatus = 0U;

        /* Point to next channel object */
        xdmacChObj++;
    }

    return;
}

void XDMAC0_ChannelCallbackRegister( XDMAC_CHANNEL channel, const XDMAC_CHANNEL_CALLBACK eventHandler, const uintptr_t contextHandle )
{
    xdmacChannelObj[channel].callback = eventHandler;
    xdmacChannelObj[channel].context = contextHandle;

    return;
}

bool XDMAC0_ChannelTransfer( XDMAC_CHANNEL channel, const void *srcAddr, const void *destAddr, size_t blockSize )
{
    volatile uint32_t status = 0U;
    bool returnStatus = false;
    const uint8_t* psrcAddr  = (const uint8_t*)srcAddr;
    const uint8_t* pdestAddr = (const uint8_t*)destAddr;

    if ((channel < (XDMAC_CHANNEL)XDMAC_ACTIVE_CHANNELS_MAX) && ((xdmacChannelObj[channel].busyStatus == 0U) ||
                ((XDMAC0_REGS->XDMAC_GS & (XDMAC_GS_ST0_Msk << (uint32_t)channel)) == 0U))
                            && (srcAddr != NULL) && (destAddr != NULL))
    {
        /* Clear channel level status before adding transfer parameters */
        status = XDMAC0_REGS->XDMAC_CHID[channel].XDMAC_CIS;
        (void)status;

        xdmacChannelObj[channel].busyStatus = 1U;

        /*Set source address */
        XDMAC0_REGS->XDMAC_CHID[channel].XDMAC_CSA= (uint32_t)psrcAddr;

        /* Set destination address */
        XDMAC0_REGS->XDMAC_CHID[channel].XDMAC_CDA= (uint32_t)pdestAddr;

        /* Set block size */
        XDMAC0_REGS->XDMAC_CHID[channel].XDMAC_CUBC= XDMAC_CUBC_UBLEN(blockSize);

        /* Make sure all memory transfers are completed before enabling the DMA */
        __DMB();

        /* Enable the channel */
        XDMAC0_REGS->XDMAC_GE= (XDMAC_GE_EN0_Msk << (uint32_t)channel);

        returnStatus = true;
    }
    else
    {
        PLIB_COMMON_UpdateErrorStatus(XDMAC_ERROR_INVALID_PARAMETER);
    }

    return returnStatus;
}

XDMAC_TRANSFER_EVENT XDMAC0_ChannelTransferStatusGet(XDMAC_CHANNEL channel)
{
    uint32_t chanIntStatus;

    XDMAC_TRANSFER_EVENT xdmacTransferStatus = XDMAC_TRANSFER_NONE;

    if(channel < (XDMAC_CHANNEL)XDMAC_ACTIVE_CHANNELS_MAX)
    {
        /* Read the interrupt status for the requested DMA channel */
        chanIntStatus = XDMAC0_REGS->XDMAC_CHID[channel].XDMAC_CIS;

        if ((chanIntStatus & ( XDMAC_CIS_RBEIS_Msk | XDMAC_CIS_WBEIS_Msk | XDMAC_CIS_ROIS_Msk)) != 0U)
        {
            xdmacTransferStatus = XDMAC_TRANSFER_ERROR;
        }
        else if ((chanIntStatus & XDMAC_CIS_BIS_Msk) != 0U)
        {
            xdmacTransferStatus = XDMAC_TRANSFER_COMPLETE;
        }
        else
        {
            /* Nothing to do */
        }
    }
    else
    {
        PLIB_COMMON_UpdateErrorStatus(XDMAC_ERROR_INVALID_PARAMETER);
    }

    return xdmacTransferStatus;
}

bool XDMAC0_ChannelLinkedListTransfer (XDMAC_CHANNEL channel, uint32_t firstDescriptorAddress, XDMAC_DESCRIPTOR_CONTROL* firstDescriptorControl)
{
    volatile uint32_t status = 0;
    bool returnStatus = false;

    if (((xdmacChannelObj[channel].busyStatus == 0U) ||
            ((XDMAC0_REGS->XDMAC_GS & (XDMAC_GS_ST0_Msk << (uint32_t)channel)) == 0U)) && (channel < (XDMAC_CHANNEL)XDMAC_ACTIVE_CHANNELS_MAX))
    {
        /* Clear channel level status before adding transfer parameters */
        status = XDMAC0_REGS->XDMAC_CHID[channel].XDMAC_CIS;
        (void)status;

        xdmacChannelObj[channel].busyStatus = 1U;

        /* First descriptor control set */
        XDMAC0_REGS->XDMAC_CHID[channel].XDMAC_CNDC= (uint32_t)(firstDescriptorControl->descriptorControl);

        /* First descriptor address set */
        XDMAC0_REGS->XDMAC_CHID[channel].XDMAC_CNDA= ( (firstDescriptorAddress & XDMAC_CNDA_NDA_Msk) | XDMAC_CNDA_NDAIF_Msk );

        /* Enable end of linked list interrupt source */
        XDMAC0_REGS->XDMAC_CHID[channel].XDMAC_CIE= XDMAC_CIE_LIE_Msk;

        /* Enable the channel */
        XDMAC0_REGS->XDMAC_GE= (XDMAC_GE_EN0_Msk << (uint32_t)channel);

        returnStatus = true;
    }
    else
    {
        PLIB_COMMON_UpdateErrorStatus(XDMAC_ERROR_INVALID_PARAMETER);
    }

    return returnStatus;
}
