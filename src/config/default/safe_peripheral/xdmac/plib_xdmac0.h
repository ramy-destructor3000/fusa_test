/*******************************************************************************
  XDMAC PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_xdmac0.h

  Summary:
    XDMAC PLIB Header File

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

#ifndef PLIB_XDMAC_H
#define PLIB_XDMAC_H

#include <stddef.h>
#include <stdbool.h>
#include "plib_xdmac_common.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Interface
// *****************************************************************************
// *****************************************************************************

/****************************** XDMAC Data Types ******************************/
/* XDMAC Channels */
typedef enum {
    XDMAC_CHANNEL_0 = 0,
    XDMAC_CHANNEL_1 = 1,
    XDMAC_CHANNEL_2 = 2,
    XDMAC_CHANNEL_3 = 3,
    XDMAC_CHANNEL_4 = 4,
    XDMAC_CHANNEL_5 = 5,
    XDMAC_CHANNEL_6 = 6,
    XDMAC_CHANNEL_7 = 7,
    XDMAC_CHANNEL_8 = 8,
    XDMAC_CHANNEL_9 = 9,
    XDMAC_CHANNEL_10 = 10,
    XDMAC_CHANNEL_11 = 11,
    XDMAC_CHANNEL_12 = 12,
    XDMAC_CHANNEL_13 = 13,
    XDMAC_CHANNEL_14 = 14,
    XDMAC_CHANNEL_15 = 15,
} XDMAC_CHANNEL;


/****************************** XDMAC API *********************************/

void XDMAC0_Initialize( void );

void XDMAC0_ChannelCallbackRegister( XDMAC_CHANNEL channel, const XDMAC_CHANNEL_CALLBACK eventHandler, const uintptr_t contextHandle );

bool XDMAC0_ChannelTransfer( XDMAC_CHANNEL channel, const void *srcAddr, const void *destAddr, size_t blockSize );

XDMAC_TRANSFER_EVENT XDMAC0_ChannelTransferStatusGet(XDMAC_CHANNEL channel);

bool XDMAC0_ChannelLinkedListTransfer (XDMAC_CHANNEL channel, uint32_t firstDescriptorAddress, XDMAC_DESCRIPTOR_CONTROL* firstDescriptorControl);

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif
// DOM-IGNORE-END
#endif // PLIB_XDMAC_H
