/*******************************************************************************
  UART0 PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_uart0.c

  Summary:
    UART0 PLIB Implementation File

  Description:
    None

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
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
#include "plib_uart0.h"
#include "interrupts.h"
#include "safe_peripheral/common/plib_common.h"

// *****************************************************************************
// *****************************************************************************
// Section: UART0 Implementation
// *****************************************************************************
// *****************************************************************************

static UART_OBJECT uart0Obj;

void UART0_InterruptHandler( void )
{
    if( uart0Obj.Callback != NULL )
    {
        uart0Obj.Callback(uart0Obj.Context);
    }
    else
    {
        PLIB_COMMON_UpdateErrorStatus(UART_ERROR_CALLBACK_NOT_REGISTERED);
    }
}

void UART0_Initialize( void )
{
    /* Reset UART0 */
    UART0_REGS->UART_CR = (UART_CR_RSTRX_Msk | UART_CR_RSTTX_Msk | UART_CR_RSTSTA_Msk);

    /* Enable UART0 */
    UART0_REGS->UART_CR = (UART_CR_TXEN_Msk | UART_CR_RXEN_Msk);

    /* Configure UART0 mode */
    UART0_REGS->UART_MR = ((UART_MR_BRSRCCK_PERIPH_CLK) | (UART_MR_PAR_NO) | (0U << UART_MR_FILTER_Pos));

    /* Configure UART0 Baud Rate */
    UART0_REGS->UART_BRGR = UART_BRGR_CD(45);

    /* Initialize instance object */
    uart0Obj.Callback = NULL;

}

void UART0_CallbackRegister( UART_CALLBACK callback, uintptr_t context )
{
    uart0Obj.Callback = callback;

    uart0Obj.Context = context;
}
