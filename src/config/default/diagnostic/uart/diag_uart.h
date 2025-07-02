/*******************************************************************************
 UART Diagnostics Library Interface Header file
  
  Company:
    Microchip Technology Inc.

  File Name:
    diag_uart.h

  Summary:
    Header file for UART diagnostic library.

  Description:
    This file provides function prototypes, macros and data types for the
    UART diagnostics.

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

#ifndef DIAG_UART_H
#define DIAG_UART_H

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {    

#endif
// DOM-IGNORE-END

/*----------------------------------------------------------------------------
 *     Include files
 *----------------------------------------------------------------------------*/    
#include "diagnostic/common/diag_common.h"
#include "diag_uart_switcher.h"

/*----------------------------------------------------------------------------
 *     Constants
 *----------------------------------------------------------------------------*/            
 
#define DIAG_UART_TIMEOUT_COUNT                            10000
#define DIAG_UART_INTERRUPT_DELAY                          25000
#define DIAG_UART_INTERRUPT_TXRDY_TEST_ERROR               1
#define DIAG_UART_INTERRUPT_TXEMPTY_TEST_ERROR             2
#define DIAG_UART_INTERRUPT_RXRDY_TEST_ERROR               3
#define DIAG_UART_INTERRUPT_COMPARE_TEST_ERROR             4
#define DIAG_UART_INTERRUPT_OVERRUN_TEST_ERROR             5
#define DIAG_UART_INTERRUPT_PARITY_TEST_ERROR              6
#define DIAG_UART_INTERRUPT_FRAME_TEST_ERROR               7
#define DIAG_UART_COMMUNICATION_TXRDY_TEST_ERROR           8
#define DIAG_UART_COMMUNICATION_RXRDY_TEST_ERROR           9       
#define DIAG_UART_DMAREQ_TXCHANNEL_STATUS_ERROR            10
#define DIAG_UART_DMAREQ_RXCHANNEL_STATUS_ERROR            11
        
/*----------------------------------------------------------------------------
 *     Data types
 *----------------------------------------------------------------------------*/
// *****************************************************************************

typedef struct diag_uart_object
{
    const uint8_t *txMessagePtr;
    uint8_t *rxMessagePtr;
    size_t txRxMessageLength;
    volatile uint32_t interruptGeneration;
    volatile uint32_t interruptClear;
    bool diagnosticInProgress;
} DIAG_UART_OBJECT;

// *****************************************************************************

/*----------------------------------------------------------------------------
 *     Functions
 *----------------------------------------------------------------------------*/
DIAG_STATUS DIAG_UART_Enable(DIAG_UART_INSTANCE uartInstance);

DIAG_STATUS DIAG_UART_Disable(DIAG_UART_INSTANCE uartInstance);

DIAG_STATUS DIAG_UART_Communication(DIAG_UART_INSTANCE uartInstance);

DIAG_STATUS DIAG_UART_DMARequest(DIAG_UART_INSTANCE uartInstance);

DIAG_STATUS DIAG_UART_REGReset(DIAG_UART_INSTANCE uartInstance);

DIAG_STATUS DIAG_UART_REGWriteRead(DIAG_UART_INSTANCE uartInstance);

DIAG_STATUS DIAG_UART_REGWriteProtection(DIAG_UART_INSTANCE uartInstance);

DIAG_STATUS DIAG_UART_Interrupt(DIAG_UART_INSTANCE uartInstance);

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif
// DOM-IGNORE-END
#endif // DIAG_UART_H
