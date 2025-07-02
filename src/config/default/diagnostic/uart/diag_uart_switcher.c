/*******************************************************************************
  Diagnostic Switcher file

  Company
    Microchip Technology Inc.

  File Name
    diag_uart_switcher.c

  Summary
    Source file for UART Diagnostics Library for switching between multiple instance Interface.

  Description
    This file defines the interface to the UART peripheral library. This
    library provides access to and control of the associated peripheral
    instance.

  Remarks:
    None.
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

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "diag_uart_switcher.h"

/*----------------------------------------------------------------------------
 *     Functions
 *----------------------------------------------------------------------------*/
uart_registers_t* lDIAG_UART_GetInstanceAddress(DIAG_UART_INSTANCE uartInstance)
{
    uart_registers_t* uartInstanceAddress = NULL;
    switch (uartInstance)
    {
        default:
        {
            uartInstanceAddress = NULL;
            break;
        }
    }
    return uartInstanceAddress;
}

bool lDIAG_UART_GetXDMACChannel(DIAG_UART_INSTANCE uartInstance, XDMAC_CHANNEL *txChannel,XDMAC_CHANNEL *rxChannel)
{
    bool retVal = false;
    
    if((txChannel != NULL) && (rxChannel != NULL))
    {
        switch(uartInstance)
        {
            default:
            {
                retVal = false;
                break;
            } 
        }
    }
    else
    {
        /* Report an error */
    }
    
    return retVal;    
}

void lDIAG_UART_CallbackRegister (DIAG_UART_INSTANCE uartInstance, UART_CALLBACK callback, uintptr_t context)
{
    switch (uartInstance)
    {
        default:
                /* Nothing to do */
            break;
        
    }
}