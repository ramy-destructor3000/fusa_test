/*******************************************************************************
 UART Diagnostics Library Source file

  Company:
    Microchip Technology Inc.

  File Name:
    diag_uart.c

  Summary:
    Source file for UART diagnostics.

  Description:
    This file provides functions for the UART diagnostics.

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

/*----------------------------------------------------------------------------
 *     Include files
 *----------------------------------------------------------------------------*/
#include "diag_uart.h"

/*----------------------------------------------------------------------------
 *     Variables
 *----------------------------------------------------------------------------*/
/* Tx and Rx buffer needs to be aligned with 32 byte size and address to match with cache line */
static const uint8_t __attribute__ ((aligned(32))) txMessage[32] = "UART Test!!";
static uint8_t __attribute__ ((aligned(32))) rxMessage[sizeof(txMessage)];

static DIAG_UART_OBJECT diagUartObj =
{
    .interruptGeneration  = 0,
    .interruptClear       = 0,
    .diagnosticInProgress = false,
    .txMessagePtr         = txMessage,
    .rxMessagePtr         = rxMessage,
    .txRxMessageLength    = 12      /* 12 byte data selected to complete routine within FTTI */
};

/* MISRAC 2012 false positive block start */
/* MISRA C-2012 Rule 7.2 false positive 1 times. */
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunknown-pragmas"
#pragma coverity compliance block false_positive:1 "MISRA C-2012 Rule 7.2"

static const DIAG_REG_RESET_INFO uartResetRegInfo[] = {
    {UART_MR_REG_OFST,      0,  UART_MR_Msk},
    {UART_IMR_REG_OFST,     0,  UART_IMR_Msk},
    {UART_RHR_REG_OFST,     0,  UART_RHR_Msk},
    {UART_BRGR_REG_OFST,    0,  UART_BRGR_Msk},
    {UART_CMPR_REG_OFST,    0,  UART_CMPR_Msk},
    {UART_WPMR_REG_OFST,    0,  UART_WPMR_Msk},
};

static const DIAG_REG_INFO uartREGInfo[] = {
    {UART_MR_REG_OFST,      UART_MR_REG_OFST,   UART_MR_REG_OFST,   UART_MR_Msk,    false},
    {UART_BRGR_REG_OFST,    UART_BRGR_REG_OFST, UART_BRGR_REG_OFST, UART_BRGR_Msk,  false},
    {UART_CMPR_REG_OFST,    UART_CMPR_REG_OFST, UART_CMPR_REG_OFST, UART_CMPR_Msk,  false},
};

static const DIAG_REG_INFO uartWpRegSet[] = {
    {UART_MR_REG_OFST,      UART_MR_REG_OFST,   UART_MR_REG_OFST,   UART_MR_FILTER_Msk, false},
    {UART_BRGR_REG_OFST,    UART_BRGR_REG_OFST, UART_BRGR_REG_OFST, UART_BRGR_CD_Msk,   false},
    {UART_CMPR_REG_OFST,    UART_CMPR_REG_OFST, UART_CMPR_REG_OFST, UART_CMPR_Msk,      false},
};

#pragma coverity compliance end_block "MISRA C-2012 Rule 7.2"
#pragma GCC diagnostic pop
/* MISRAC 2012 false positive block end */
/*----------------------------------------------------------------------------
 *     Functions
 *----------------------------------------------------------------------------*/

/*============================================================================
static void lDIAG_UART_InterruptClear(uart_registers_t* uart_reg, 
                                            uint32_t srMask, uint32_t imrMask)
------------------------------------------------------------------------------
Purpose: Used to check whether the requested interrupt is getting clear or not.
Input  : uart_reg - Peripheral address.
         srMask - Interrupt status mask
         imrMask - Interrupt IMR mask
Output : None
Notes  : None
============================================================================*/
static void lDIAG_UART_InterruptClear(uart_registers_t* uart_reg, uint32_t srMask, uint32_t imrMask)
{
    int32_t delayCounter = DIAG_UART_TIMEOUT_COUNT;

    if(NULL != uart_reg)
    {
        while((srMask == (uart_reg->UART_SR & srMask)) && (0 < delayCounter))
        {
            --delayCounter;
        }
        if(0 < delayCounter)
        {
            diagUartObj.interruptClear |= imrMask;
        }
        else
        {
            /* Do nothing */
        }
    }
}

/*============================================================================
static void lDIAG_UART_InterruptCallback(uintptr_t uart_address)
------------------------------------------------------------------------------
Purpose: Callback used for interrupt diagnosis.
Input  : uart_address - Peripheral address.
Output : retVal - Diagnostics status.
Notes  : None
============================================================================*/
static void lDIAG_UART_InterruptCallback(uintptr_t uart_address)
{
    uint32_t diaguartMaskbit    = 0x00;
    uint32_t diaguartIMRMask    = 0x00;
    uint32_t diaguartSRMask     = 0x00;
    uart_registers_t* uart_reg  = (uart_registers_t*)uart_address;

    if((NULL != uart_reg) && (diagUartObj.diagnosticInProgress == true))
    {
        diaguartMaskbit = uart_reg->UART_IMR;

        switch(diaguartMaskbit)
        {
            case UART_IMR_TXRDY_Msk:
            {
                if(UART_SR_TXRDY_Msk == (uart_reg->UART_SR & UART_SR_TXRDY_Msk))
                {
                    diagUartObj.interruptGeneration |= UART_IMR_TXRDY_Msk;

                    /* Clear TXRDY interrupt by loading value into THR register */
                    uart_reg->UART_THR  = 0xFF;
                    
                    diaguartIMRMask = UART_IMR_TXRDY_Msk;
                    diaguartSRMask = UART_SR_TXRDY_Msk;
                    
                    /* Check for interrupt clear */
                    lDIAG_UART_InterruptClear(uart_reg, diaguartSRMask, diaguartIMRMask);

                    uart_reg->UART_IDR = UART_IDR_TXRDY_Msk;
                }
                else
                {
                    /* Do nothing */
                }
                break;
            }
            case UART_IMR_TXEMPTY_Msk:
            {
                if(UART_SR_TXEMPTY_Msk == (uart_reg->UART_SR & UART_SR_TXEMPTY_Msk))
                {
                    diagUartObj.interruptGeneration |= UART_IMR_TXEMPTY_Msk;

                    /* Clear TXEMPTY interrupt by loading value into THR register */
                    uart_reg->UART_THR  = 0xFF;
                    
                    diaguartIMRMask = UART_IMR_TXEMPTY_Msk;
                    diaguartSRMask = UART_SR_TXEMPTY_Msk;
                    
                    /* Check for interrupt clear */
                    lDIAG_UART_InterruptClear(uart_reg, diaguartSRMask, diaguartIMRMask);
                    
                    uart_reg->UART_IDR = UART_IDR_TXEMPTY_Msk;
                }
                else
                {
                    /* Do nothing */
                }
                break;
            }
            case UART_IMR_RXRDY_Msk:
            {
                if(UART_SR_RXRDY_Msk == (uart_reg->UART_SR & UART_SR_RXRDY_Msk))
                {
                    (void)uart_reg->UART_RHR;
                    diagUartObj.interruptGeneration |= UART_IMR_RXRDY_Msk;

                    /* Clear RXRDY interrupt by reading RHR register */
                    *diagUartObj.rxMessagePtr = (uint8_t)uart_reg->UART_RHR;

                    diaguartIMRMask = UART_IMR_RXRDY_Msk;
                    diaguartSRMask = UART_SR_RXRDY_Msk;
                    
                    /* Check for interrupt clear */
                    lDIAG_UART_InterruptClear(uart_reg, diaguartSRMask, diaguartIMRMask);
                    
                    uart_reg->UART_IDR = UART_IDR_RXRDY_Msk;
                }
                else
                {
                    /* Do nothing */
                }
                break;
            }
            case UART_IMR_CMP_Msk:
            {
                if(UART_SR_CMP_Msk == (uart_reg->UART_SR & UART_SR_CMP_Msk))
                {
                    diagUartObj.interruptGeneration |= UART_IMR_CMP_Msk;

                    /* Clear the CMP interrupt flag */
                    uart_reg->UART_CR  = UART_CR_RSTSTA_Msk;
                    
                    diaguartIMRMask = UART_IMR_CMP_Msk;
                    diaguartSRMask = UART_SR_CMP_Msk;
                    
                    /* Check for interrupt clear */
                    lDIAG_UART_InterruptClear(uart_reg, diaguartSRMask, diaguartIMRMask);
                    
                    uart_reg->UART_IDR = UART_IDR_CMP_Msk;
                }
                else
                {
                    /* Do nothing */
                }
                break;
            }
            case UART_IMR_OVRE_Msk:
            {
                if(UART_SR_OVRE_Msk == (uart_reg->UART_SR & UART_SR_OVRE_Msk))
                {
                    diagUartObj.interruptGeneration |= UART_IMR_OVRE_Msk;

                    /* Clear the Over Run Error interrupt flag */
                    uart_reg->UART_CR  = UART_CR_RSTSTA_Msk;
                    
                    diaguartIMRMask = UART_IMR_OVRE_Msk;
                    diaguartSRMask = UART_SR_OVRE_Msk;
                    
                    /* Check for interrupt clear */
                    lDIAG_UART_InterruptClear(uart_reg, diaguartSRMask, diaguartIMRMask);
                    
                    uart_reg->UART_IDR = UART_IDR_OVRE_Msk;
                }
                else
                {
                    /* Do nothing */
                }
                break;
            }
            default:
            {
                /* Do nothing */
                break;
            }
        }
    }
    else
    {
        /* Do nothing */
    }
}

/*============================================================================
static bool lDIAG_UART_WriteRead(uart_registers_t* uart_reg, const void *txBuffer, void *rxBuffer, const size_t size)
------------------------------------------------------------------------------
Purpose: Used by diagnostic routine to perform write and read operations.
Input  : uart_reg - Peripheral address, txBuffer - transmit buffer address,
 *       rxBuffer -  Receive buffer address, size - Size of transmit data
Output : status - Status of write read operation.
Notes  : None
============================================================================*/
static bool lDIAG_UART_WriteRead(uart_registers_t* uart_reg, const void *txBuffer, void *rxBuffer, const size_t size)
{
    bool status = false;
    size_t processedSize = 0;
    uint32_t errorStatus = 0;
    uint8_t* prxBuffer = (uint8_t *) rxBuffer;
    const uint8_t* ptxBuffer = (const uint8_t *) txBuffer;
    int32_t delayCounter = DIAG_UART_TIMEOUT_COUNT;

    if ((NULL != ptxBuffer) && (NULL != prxBuffer) && (NULL != uart_reg))
    {
        while (size > processedSize)
        {
            /* Write byte */
            delayCounter = DIAG_UART_TIMEOUT_COUNT;
            while((!(UART_SR_TXRDY_Msk == (uart_reg->UART_SR & UART_SR_TXRDY_Msk))) && (0 < delayCounter))
            {
                --delayCounter;
            }
            if(0 < delayCounter)
            {
                /* Do nothing */
            }
            else
            {
                /* Update global error status if the interrupt has not occurred within timeout */
                DIAG_COMMON_UpdateErrorStatus(DIAG_UART_COMMUNICATION_TXRDY_TEST_ERROR);
                break;
            }

            uart_reg->UART_THR = (ptxBuffer[processedSize++] & UART_THR_TXCHR_Msk);

            /* Read byte */
            delayCounter = DIAG_UART_TIMEOUT_COUNT;
            while ((!(UART_SR_RXRDY_Msk == (uart_reg->UART_SR & UART_SR_RXRDY_Msk))) && (0 < delayCounter))
            {
                --delayCounter;
            }

            if(0 < delayCounter)
            {
                /* Do nothing */
            }
            else
            {
                /* Update global error status if the interrupt has not occurred within timeout */
                DIAG_COMMON_UpdateErrorStatus(DIAG_UART_COMMUNICATION_RXRDY_TEST_ERROR);
                break;
            }

            /* Error status */
            errorStatus = (uart_reg->UART_SR & (UART_SR_OVRE_Msk | UART_SR_FRAME_Msk | UART_SR_PARE_Msk));

            if (errorStatus != 0U)
            {
                break;
            }
            else
            {
                /* Do nothing */
            }

             /* 8 Bit mode support */
            *prxBuffer = (uint8_t)(uart_reg->UART_RHR& UART_RHR_RXCHR_Msk);
            prxBuffer++;
        }
        if(processedSize == size)
        {
            status = true;
        }
        else
        {
            /* Do nothing */
        }
    }
    return status;
}

/*============================================================================
static void inline lDIAG_UART_EnableLocalLoopback(uart_registers_t* uart_reg)
------------------------------------------------------------------------------
Purpose: Used by diagnostic routines to enable local loop back mode.
Input  : uart_reg - Peripheral address
Output : None.
Notes  : None
============================================================================*/
static void inline lDIAG_UART_EnableLocalLoopback(uart_registers_t* uart_reg)
{
    if(NULL != uart_reg)
    {
        uart_reg->UART_MR &= ~(UART_MR_CHMODE_LOCAL_LOOPBACK);
        uart_reg->UART_MR |= UART_MR_CHMODE_LOCAL_LOOPBACK;
    }
    else
    {
        /* Do nothing */
    }
}

/*============================================================================
DIAG_STATUS DIAG_UART_Enable(DIAG_UART_INSTANCE uartInstance)
------------------------------------------------------------------------------
Purpose: Checks the UART enabling status.
Input  : uartInstance - Peripheral ID.
Output : retVal - Diagnostics status.
Notes  : Clock should be enabled for UART
============================================================================*/
DIAG_STATUS DIAG_UART_Enable(DIAG_UART_INSTANCE uartInstance)
{
    DIAG_STATUS retVal          = DIAG_STATUS_NOT_EXECUTED;
    uart_registers_t* uart_reg  = NULL;

    uart_reg = lDIAG_UART_GetInstanceAddress(uartInstance);
    if(NULL != uart_reg)
    {
        /* Enable UART */
        uart_reg->UART_CR = UART_CR_TXEN_Msk;

        /* Check the transmit ready bit */
        if(UART_SR_TXRDY_Msk == (uart_reg->UART_SR & UART_SR_TXRDY_Msk))
        {
            retVal = DIAG_STATUS_PASSED;
        }
        else
        {
            retVal = DIAG_STATUS_FAILED;
        }
    }
    else
    {
        /* Do nothing */
    }
    return retVal;
}

/*============================================================================
DIAG_STATUS DIAG_UART_Disable(DIAG_UART_PERIPHS uartInstance)
------------------------------------------------------------------------------
Purpose: Checks the UART disabling status.
Input  : uartInstance - Peripheral ID.
Output : retVal - Diagnostics status.
Notes  : Clock should be enabled for UART
============================================================================*/
DIAG_STATUS DIAG_UART_Disable(DIAG_UART_INSTANCE uartInstance)
{
    DIAG_STATUS retVal          = DIAG_STATUS_NOT_EXECUTED;
    uart_registers_t* uart_reg  = NULL;

    uart_reg = lDIAG_UART_GetInstanceAddress(uartInstance);
    if(NULL != uart_reg)
    {
        /* Disable UART */
        uart_reg->UART_CR = UART_CR_TXDIS_Msk;

        /* Check the transmit ready bit */
        if(UART_SR_TXRDY(0) == (uart_reg->UART_SR & UART_SR_TXRDY_Msk))
        {
            /* Disable peripheral clock for UART instance */
            PMC_REGS->PMC_PCDR0 |= (1UL << (uint32_t)uartInstance);

            if((1UL << (uint32_t)uartInstance) != (PMC_REGS->PMC_PCSR0 & (1UL << (uint32_t)uartInstance)))
            {
                retVal = DIAG_STATUS_PASSED;
            }
            else
            {
                retVal = DIAG_STATUS_FAILED;
            }
        }
        else
        {
            retVal = DIAG_STATUS_FAILED;
        }
    }
    else
    {
        /* Do nothing */
    }
    return retVal;
}

/*============================================================================
DIAG_STATUS DIAG_UART_Communication(DIAG_UART_INSTANCE uartInstance)
------------------------------------------------------------------------------
Purpose: Checks whether UART able to transmit and receive.
Input  : uartInstance - Peripheral ID.
Output : retVal - Diagnostics status.
Notes  : UART instance should be initialized.
 *       Clock should be enabled for UART
============================================================================*/
DIAG_STATUS DIAG_UART_Communication(DIAG_UART_INSTANCE uartInstance)
{
    DIAG_STATUS retVal = DIAG_STATUS_NOT_EXECUTED;
    uart_registers_t* uart_reg  = NULL;
    bool writeReadStatus = false;

    uart_reg = lDIAG_UART_GetInstanceAddress(uartInstance);
    if (NULL != uart_reg)
    {
        DIAG_COMMON_memset(diagUartObj.rxMessagePtr, '\0', diagUartObj.txRxMessageLength);
        lDIAG_UART_EnableLocalLoopback(uart_reg);

        /* Clear RHR by reading it */
        (void)uart_reg->UART_RHR;

        writeReadStatus = lDIAG_UART_WriteRead(uart_reg, diagUartObj.txMessagePtr, diagUartObj.rxMessagePtr,\
                    diagUartObj.txRxMessageLength);

        if((true == writeReadStatus) && \
                (0 == DIAG_COMMON_memcmp(diagUartObj.txMessagePtr, diagUartObj.rxMessagePtr, diagUartObj.txRxMessageLength)))
        {
            retVal = DIAG_STATUS_PASSED;
        }
        else
        {
            retVal = DIAG_STATUS_FAILED;
        }
    }
    else
    {
        /* Do nothing */
    }
    return retVal;
}

/*============================================================================
DIAG_STATUS DIAG_UART_DMARequest(DIAG_UART_INSTANCE uartInstance)
------------------------------------------------------------------------------
Purpose: Checks the DMA related functionality.
Input  : uartInstance - Peripheral ID.
Output : retVal - Diagnostics status.
Notes  : UART instance and XDMAC should initialized.
 *       Clock should be enabled for UART
============================================================================*/
/* MISRAC 2012 false positive block start */
/* MISRA C-2012 Rule 11.3 false positive 2 times. */
/* MISRA C-2012 Rule 11.8 false positive 1 times. */
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunknown-pragmas"
#pragma coverity compliance block false_positive:1 "MISRA C-2012 Rule 11.3"
#pragma coverity compliance block false_positive:1 "MISRA C-2012 Rule 11.8"

DIAG_STATUS DIAG_UART_DMARequest(DIAG_UART_INSTANCE uartInstance)
{
    DIAG_STATUS retVal         = DIAG_STATUS_NOT_EXECUTED;
    uart_registers_t* uart_reg = NULL;
    int32_t delayCounter      = DIAG_UART_TIMEOUT_COUNT;
    XDMAC_CHANNEL txChannel    = XDMAC_CHANNEL_0;
    XDMAC_CHANNEL rxChannel    = XDMAC_CHANNEL_0;

    uart_reg = lDIAG_UART_GetInstanceAddress(uartInstance);
    if ((NULL != uart_reg) && (true == lDIAG_UART_GetXDMACChannel(uartInstance, &txChannel, &rxChannel)))
    {
        DIAG_COMMON_memset(diagUartObj.rxMessagePtr, '\0', diagUartObj.txRxMessageLength);
        lDIAG_UART_EnableLocalLoopback(uart_reg);

        /* Clear RHR by reading it */
        (void)uart_reg->UART_RHR;

        (void) XDMAC0_ChannelTransfer(rxChannel, (const void *) &(uart_reg->UART_RHR), (const void *) diagUartObj.rxMessagePtr, diagUartObj.txRxMessageLength);
        (void) XDMAC0_ChannelTransfer(txChannel, (const void *) diagUartObj.txMessagePtr, (const void *) &(uart_reg->UART_THR), diagUartObj.txRxMessageLength);

        while ((XDMAC_TRANSFER_NONE == XDMAC0_ChannelTransferStatusGet(txChannel)) && (0 < delayCounter))
        {
            --delayCounter;
        }

        if (0 < delayCounter)
        {
            delayCounter = DIAG_UART_TIMEOUT_COUNT;
        }
        else
        {
            retVal = DIAG_STATUS_FAILED;
            /* Update global error status if the interrupt has not occurred within timeout */
            DIAG_COMMON_UpdateErrorStatus(DIAG_UART_DMAREQ_TXCHANNEL_STATUS_ERROR);
        }

        if(retVal != DIAG_STATUS_FAILED)
        {
            while((XDMAC_TRANSFER_NONE == XDMAC0_ChannelTransferStatusGet(rxChannel)) && (0 < delayCounter))
            {
               --delayCounter;
            }

            /* Cache Invalidate */
            /* cppcheck-suppress misra-c2012-11.3 */
            DCACHE_INVALIDATE_BY_ADDR((uint32_t *) diagUartObj.rxMessagePtr, (int32_t)diagUartObj.txRxMessageLength);
            if ((0 < delayCounter) && (0 == DIAG_COMMON_memcmp(diagUartObj.txMessagePtr, diagUartObj.rxMessagePtr, diagUartObj.txRxMessageLength)))
            {
               retVal = DIAG_STATUS_PASSED;
            }
            else
            {
               retVal = DIAG_STATUS_FAILED;
               /* Update global error status if the interrupt has not occurred within timeout */
               DIAG_COMMON_UpdateErrorStatus(DIAG_UART_DMAREQ_RXCHANNEL_STATUS_ERROR);
            }
        }
    }
    else
    {
        /* Do nothing */
    }
    return retVal;
}

#pragma coverity compliance end_block "MISRA C-2012 Rule 11.3"
#pragma coverity compliance end_block "MISRA C-2012 Rule 11.8"
#pragma GCC diagnostic pop
/* MISRAC 2012 false positive block end */

/*============================================================================
DIAG_STATUS DIAG_UART_REGReset(DIAG_UART_INSTANCE uartInstance)
------------------------------------------------------------------------------
Purpose: Checks reset values of UART registers.
Input  : uartInstance - Peripheral ID.
Output : retVal - Diagnostics status.
Notes  : Clock should be enabled for UART.
============================================================================*/
DIAG_STATUS DIAG_UART_REGReset(DIAG_UART_INSTANCE uartInstance)
{
    DIAG_STATUS retVal         = DIAG_STATUS_NOT_EXECUTED;
    uart_registers_t* uart_reg = NULL;

    uart_reg = lDIAG_UART_GetInstanceAddress(uartInstance);
    if (NULL != uart_reg)
    {
        retVal = DIAG_COMMON_REG_Reset((uint32_t)uart_reg, uartResetRegInfo, (sizeof(uartResetRegInfo) / sizeof(DIAG_REG_RESET_INFO)));
    }
    else
    {
        /* Do nothing */
    }
    return retVal;
}

/*============================================================================
DIAG_STATUS DIAG_UART_REGWriteRead(DIAG_UART_INSTANCE uartInstance)
------------------------------------------------------------------------------
Purpose: Checks write/read operation on UART registers.
Input  : uartInstance - Peripheral ID.
Output : retVal - Diagnostics status.
Notes  : Write protection for UART REGs must be disabled before calling this routine.
 *       NVIC should be disabled.
 *       Clock should be enabled for UART
============================================================================*/
DIAG_STATUS DIAG_UART_REGWriteRead(DIAG_UART_INSTANCE uartInstance)
{
    DIAG_STATUS retVal         = DIAG_STATUS_NOT_EXECUTED;
    uart_registers_t* uart_reg = NULL;

    uart_reg = lDIAG_UART_GetInstanceAddress(uartInstance);
    if (NULL != uart_reg)
    {
        retVal = DIAG_COMMON_REG_WriteRead((uint32_t)uart_reg, uartREGInfo, (sizeof(uartREGInfo) / sizeof(DIAG_REG_INFO)));
    }
    else
    {
        /* Do nothing */
    }
    return retVal;
}

/*============================================================================
DIAG_STATUS DIAG_UART_REGWriteProtection(DIAG_UART_INSTANCE uartInstance)
------------------------------------------------------------------------------
Purpose: Checks write protection feature of UART registers.
Input  : uartInstance - Peripheral ID.
Output : retVal - Diagnostics status.
Notes  : This routine modifies the content of write protected registers.
 *       NVIC should be disabled.
 *       Clock should be enabled for UART
============================================================================*/
DIAG_STATUS DIAG_UART_REGWriteProtection(DIAG_UART_INSTANCE uartInstance)
{
    DIAG_STATUS retVal          = DIAG_STATUS_NOT_EXECUTED;
    uart_registers_t* uart_reg  = NULL;

    uart_reg = lDIAG_UART_GetInstanceAddress(uartInstance);
    if (NULL != uart_reg)
    {
        DIAG_WP_MODE_REG Wpuart = {((uint32_t)uart_reg + UART_WPMR_REG_OFST), UART_WPMR_WPKEY_PASSWD};

        retVal = DIAG_COMMON_REG_WriteProtection((uint32_t)uart_reg, Wpuart, uartWpRegSet,(sizeof(uartWpRegSet) / sizeof(DIAG_REG_INFO)));
    }
    else
    {
        /* Do nothing */
    }
    return retVal;
}

/*============================================================================
DIAG_STATUS DIAG_UART_InterruptTxRx(DIAG_UART_INSTANCE uartInstance)
------------------------------------------------------------------------------
Purpose: Checks the Transmit and Receive interrupt functionality.
Input  : uartInstance - Peripheral ID.
Output : retVal - Diagnostics status.
Notes  : UART instance should be initialized.
 *       NVIC should be initialized.
 *       Clock should be enabled for UART
============================================================================*/
DIAG_STATUS DIAG_UART_Interrupt(DIAG_UART_INSTANCE uartInstance)
{
    DIAG_STATUS retVal              = DIAG_STATUS_NOT_EXECUTED;
    int32_t delayCounter           = DIAG_UART_TIMEOUT_COUNT;
    uart_registers_t* uart_reg      = NULL;

    uart_reg = lDIAG_UART_GetInstanceAddress(uartInstance);
    if (NULL != uart_reg)
    {
        /* Disable all the interrupts, to avoid multiple interrupts */
        uart_reg->UART_IDR = uart_reg->UART_IMR;
        
        diagUartObj.diagnosticInProgress = true;
        diagUartObj.interruptGeneration  = 0x0;
        diagUartObj.interruptClear       = 0x0;

        lDIAG_UART_EnableLocalLoopback(uart_reg);
        lDIAG_UART_CallbackRegister(uartInstance, lDIAG_UART_InterruptCallback, (uintptr_t) uart_reg);

        /* Enable TXRDY interrupt */
        uart_reg->UART_IER = UART_IER_TXRDY_Msk;

        while((!((UART_IMR_TXRDY_Msk == (diagUartObj.interruptGeneration & UART_IMR_TXRDY_Msk))&& \
                    (UART_IMR_TXRDY_Msk == (diagUartObj.interruptClear & UART_IMR_TXRDY_Msk)))) && (0 < delayCounter))
        {
            --delayCounter;
        }
        if(0 < delayCounter)
        {
            /* Enable TXEMPTY interrupt */
            uart_reg->UART_IER = UART_IER_TXEMPTY_Msk;

            delayCounter = DIAG_UART_TIMEOUT_COUNT;
            while((!((UART_IMR_TXEMPTY_Msk == (diagUartObj.interruptGeneration & UART_IMR_TXEMPTY_Msk))&& \
                    (UART_IMR_TXEMPTY_Msk == (diagUartObj.interruptClear & UART_IMR_TXEMPTY_Msk)))) && (0 < delayCounter))
            {
                --delayCounter;
            }
        }
        else
        {
            retVal = DIAG_STATUS_FAILED;

            /* Update global error status if the interrupt has not occurred within timeout */
            DIAG_COMMON_UpdateErrorStatus(DIAG_UART_INTERRUPT_TXRDY_TEST_ERROR);
        }

        if(0 < delayCounter)
        {
            /* Clear RHR by reading it */
            (void)uart_reg->UART_RHR;

            /* Enable RXRDY interrupt */
            uart_reg->UART_IER = UART_IER_RXRDY_Msk;
            uart_reg->UART_THR = 0xFF;

            delayCounter = DIAG_UART_TIMEOUT_COUNT;
            while((!((UART_IMR_RXRDY_Msk == (diagUartObj.interruptGeneration & UART_IMR_RXRDY_Msk))&& \
                    (UART_IMR_RXRDY_Msk == (diagUartObj.interruptClear & UART_IMR_RXRDY_Msk)))) && (0 < delayCounter))
            {
                --delayCounter;
            }
        }
        else if(retVal != DIAG_STATUS_FAILED)
        {
            retVal = DIAG_STATUS_FAILED;

            /* Update global error status if the interrupt has not occurred within timeout */
            DIAG_COMMON_UpdateErrorStatus(DIAG_UART_INTERRUPT_TXEMPTY_TEST_ERROR);
        }
        else
        {
            /* Do nothing */
        }

        if(0 < delayCounter)
        {
            /* Configure compare register to compare 0xFF */
            uart_reg->UART_CMPR |= (UART_CMPR_VAL1_Msk | UART_CMPR_CMPMODE_FLAG_ONLY | UART_CMPR_CMPPAR_Msk | UART_CMPR_VAL2_Msk);

            /* Enable CMP interrupt */
            uart_reg->UART_IER = UART_IER_CMP_Msk;
            uart_reg->UART_THR = 0xFF;

            delayCounter = DIAG_UART_TIMEOUT_COUNT;
            while((!((UART_IMR_CMP_Msk == (diagUartObj.interruptGeneration & UART_IMR_CMP_Msk))&& \
                    (UART_IMR_CMP_Msk == (diagUartObj.interruptClear & UART_IMR_CMP_Msk)))) && (0 < delayCounter))
            {
                --delayCounter;
            }
        }
        else if(retVal != DIAG_STATUS_FAILED)
        {
            retVal = DIAG_STATUS_FAILED;

            /* Update global error status if the interrupt has not occurred within timeout */
            DIAG_COMMON_UpdateErrorStatus(DIAG_UART_INTERRUPT_RXRDY_TEST_ERROR);
        }
        else
        {
            /* Do nothing */
        }

        if(0 < delayCounter)
        {
            /* Enable overrun interrupts */
            uart_reg->UART_IER = UART_IER_OVRE_Msk;
            uart_reg->UART_THR = 0xFF;

            /* Clear RHR by reading it */
            (void)uart_reg->UART_RHR;

            delayCounter = DIAG_UART_TIMEOUT_COUNT;
            while((!(UART_SR_RXRDY_Msk == (uart_reg->UART_SR & UART_SR_RXRDY_Msk))) && (0 < delayCounter))
            {
                --delayCounter;
            }
        }
        else if(retVal != DIAG_STATUS_FAILED)
        {
            retVal = DIAG_STATUS_FAILED;

            /* Update global error status if the interrupt has not occurred within timeout */
            DIAG_COMMON_UpdateErrorStatus(DIAG_UART_INTERRUPT_COMPARE_TEST_ERROR);
        }
        else
        {
            /* Do nothing */
        }

        if(0 < delayCounter)
        {
            delayCounter = DIAG_UART_INTERRUPT_DELAY;
            while(0 < delayCounter)
            {
                --delayCounter;
            }
            uart_reg->UART_THR = 0xFF;

            delayCounter = DIAG_UART_TIMEOUT_COUNT;
            while((!((UART_IMR_OVRE_Msk == (diagUartObj.interruptGeneration & UART_IMR_OVRE_Msk))&& \
                    (UART_IMR_OVRE_Msk == (diagUartObj.interruptClear & UART_IMR_OVRE_Msk)))) && (0 < delayCounter))
            {
                --delayCounter;
            }
            if(0 < delayCounter)
            {
                retVal = DIAG_STATUS_PASSED;
            }
            else
            {
                retVal = DIAG_STATUS_FAILED;

                /* Update global error status if the interrupt has not occurred within timeout */
                DIAG_COMMON_UpdateErrorStatus(DIAG_UART_INTERRUPT_OVERRUN_TEST_ERROR);
            }
        }
        else if(retVal != DIAG_STATUS_FAILED)
        {
            retVal = DIAG_STATUS_FAILED;

            /* Update global error status if the interrupt has not occurred within timeout */
            DIAG_COMMON_UpdateErrorStatus(DIAG_UART_INTERRUPT_OVERRUN_TEST_ERROR);
        }
        else
        {
            /* Do nothing */
        }

        diagUartObj.diagnosticInProgress = false;

        /* Disable all the enabled interrupts */
        uart_reg->UART_IDR |= uart_reg->UART_IMR;
    }
    else
    {
        /* Do nothing */
    }
    return retVal;
}
