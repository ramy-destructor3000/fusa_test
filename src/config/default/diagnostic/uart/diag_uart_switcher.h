/*******************************************************************************
   Diagnostic Switcher header interface

  Company:
    Microchip Technology Inc.

  File Name:
    diag_uart.switcher.h

  Summary:
    Contains commonly used constants and data definitions used by the switcher file of UART peripheral

  Description:
    This file contains the constants and data definitions used by the diag_uart_switcher of UART
    peripheral.
*******************************************************************************/

// DOM-IGNORE-BEGIN
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
// DOM-IGNORE-END

#ifndef DIAG_UART_SWITCHER_H    /* Guard against multiple inclusion */
#define DIAG_UART_SWITCHER_H

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include "safe_peripheral/xdmac/plib_xdmac0.h"
    
    
// *****************************************************************************
// *****************************************************************************


// *****************************************************************************
// *****************************************************************************   
// Section: Data Types
// *****************************************************************************
// *****************************************************************************

typedef enum diag_uart_instance
{
    DIAG_UART_INSTANCE0 = ID_UART0,
    DIAG_UART_INSTANCE1 = ID_UART1,
    DIAG_UART_INSTANCE2 = ID_UART2,
    DIAG_UART_INSTANCE3 = ID_UART3,
    DIAG_UART_INSTANCE4 = ID_UART4,
} DIAG_UART_INSTANCE;
    
// *****************************************************************************
/*----------------------------------------------------------------------------
 *     Functions
 *----------------------------------------------------------------------------*/
uart_registers_t* lDIAG_UART_GetInstanceAddress(DIAG_UART_INSTANCE uartInstance);

bool lDIAG_UART_GetXDMACChannel(DIAG_UART_INSTANCE uartInstance, XDMAC_CHANNEL *txChannel,XDMAC_CHANNEL *rxChannel);

void lDIAG_UART_CallbackRegister (DIAG_UART_INSTANCE uartInstance, UART_CALLBACK callback, uintptr_t context);        

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* DIAG_UART_SWITCHER_H */

/* *****************************************************************************
 End of File
 */
