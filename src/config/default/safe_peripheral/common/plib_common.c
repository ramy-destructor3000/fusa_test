/*******************************************************************************
  Common PLIB routine source file for safe peripheral library

  Company:
    Microchip Technology Inc.

  File Name:
    plib_common.c

  Summary:
    Source file for common safe PLIB routine.

  Description:
    This file provides functions for the common PLIB routine.

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2021 Microchip Technology Inc. and its subsidiaries.
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
#include "plib_common.h"
/*----------------------------------------------------------------------------
 *     Defines
 *----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
 *     Variable
 *----------------------------------------------------------------------------*/
static uint32_t safePlibErrorStatus = 0;
/*----------------------------------------------------------------------------
 *     Functions
 *----------------------------------------------------------------------------*/

/*============================================================================
void PLIB_COMMON_UpdateErrorStatus(uint32_t errStatus)
------------------------------------------------------------------------------
Purpose: Updates the global error status.
Input  : errStatus - New error status value.
Output : None.
Notes  : None.
============================================================================*/
void PLIB_COMMON_UpdateErrorStatus(uint32_t errStatus)
{
    safePlibErrorStatus = errStatus;
}

/*============================================================================
uint32_t PLIB_COMMON_GetErrorStatus(void)
------------------------------------------------------------------------------
Purpose: Returns the global error status.
Input  : None.
Output : Value of the error status variable.
Notes  : None.
============================================================================*/
uint32_t PLIB_COMMON_GetErrorStatus(void)
{
    return safePlibErrorStatus;
}

/*============================================================================
void PLIB_COMMON_ResetErrorStatus(void)
------------------------------------------------------------------------------
Purpose: Resets the global error status.
Input  : None.
Output : None.
Notes  : None.
============================================================================*/
void PLIB_COMMON_ResetErrorStatus(void)
{
    safePlibErrorStatus = 0;
}