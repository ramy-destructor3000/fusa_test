/*******************************************************************************
  SAMA5D29 Peripheral Diagnostics Library

  Company:
    Microchip Technology Inc.

  File Name:
    diag_commmon.h

  Summary:
    Common header file for diagnostics.

  Description:
    This file provides common function prototypes, macros and datatypes for the
    diagnostics library.

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

#ifndef DIAG_COMMON_H
#define DIAG_COMMON_H

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {

#endif
// DOM-IGNORE-END

/*----------------------------------------------------------------------------
 *     Include files
 *----------------------------------------------------------------------------*/
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include "device.h"
        
/*----------------------------------------------------------------------------
 *     Constants
 *----------------------------------------------------------------------------*/
#define PERIPH_WPMR_WPEN_Pos         _UINT32_(0)
#define PERIPH_WPMR_WPEN_Msk         (_UINT32_(0x1) << PERIPH_WPMR_WPEN_Pos)
#define PERIPH_WPMR_WPEN(value)      (PERIPH_WPMR_WPEN_Msk & ((value) << PERIPH_WPMR_WPEN_Pos))
/*----------------------------------------------------------------------------
 *     Variables
 *----------------------------------------------------------------------------*/
        
/*----------------------------------------------------------------------------
 *     Data types
 *----------------------------------------------------------------------------*/

/* Write Protection register details

  Summary:
  Write Protection register details

  Description:
    This can be used when checking write protection feature.

  Remarks:
    None.
*/
typedef struct
{
  uint32_t wpRegAddress;
  uint32_t wpRegKey;  
} DIAG_WP_MODE_REG;

/* REG Reset state

  Summary:
  Structure to hold reset value of REG.

  Description:
    This can be used when checking reset value of REGs.
    If the register is an RW (read-write) register, then regClear, regSet and
    regStatus shall be the same register.
    Certain peripherals have write-only registers for enabling and disabling
    specific features, in this case, status is read from a third register.
    eg. In PIO peripheral, PIO_PER, PIO_PDR, PIO_PSR corresponds to 
    regClear, regSet and regStatus.
    statusInverted parameter indicates whether the status bit is active high
    or active low. ie; if the status bit 0 indicates that the feature is enabled
    then statusInverted shall be set as 'true'.

  Remarks:
    None.
*/
typedef struct
{
    uint32_t regOffset;
    uint32_t regDefaultValue;
    uint32_t valueMask;
} DIAG_REG_RESET_INFO;

/* REG read/write and write protection info

  Summary:
  Structure to hold details of read/write or write protected registers.

  Description:
    This can be used when checking write/read or write protection operation of REGs.
    If the register is an RW (read-write) register, then regClear, regSet and
    regStatus shall be the same register.
    Certain peripherals have write-only registers for enabling and disabling
    specific features, in this case, status is read from a third register.
    eg. In PIO peripheral, PIO_PER, PIO_PDR, PIO_PSR corresponds to 
    regClear, regSet and regStatus.
    statusInverted parameter indicates whether the status bit is active high
    or active low. ie; if the status bit 0 indicates that the feature is enabled
    then statusInverted shall be set as 'true'.

  Remarks:
    None.
*/
typedef struct
{
    uint32_t regClear;
    uint32_t regSet;
    uint32_t regStatus;
    uint32_t mask;
    bool statusInverted;
} DIAG_REG_INFO;

// *****************************************************************************
/* Diagnostic return status

  Summary:
    Status returned by diagnostic routine

  Description:
    Diagnostic routines status will have one of the following values.

  Remarks:
    None.
*/

/* Conditional compilation to avoid conflict with peripheral diagnostic library. */
#ifndef ENUM_DIAG_STATUS
#define ENUM_DIAG_STATUS

typedef enum diag_status
{
    DIAG_STATUS_NOT_EXECUTED  = 0U,
    DIAG_STATUS_IN_PROGRESS = 1U,
    DIAG_STATUS_PASSED = 2U,
    DIAG_STATUS_FAILED = 3U
} DIAG_STATUS;

#endif /* End of ENUM_DIAG_STATUS */

// *****************************************************************************
/* Diagnostic context

  Summary:
    Diagnostic routine can be called in context of POST, On-Demand or In-Use.

  Description:
    None

  Remarks:
    None.
*/
typedef enum diag_context
{
    DIAG_CONTEXT_POST  = 0U,
    DIAG_CONTEXT_ON_DEMAND = 1U,
    DIAG_CONTEXT_IN_USE = 2U    
} DIAG_CONTEXT;

/*----------------------------------------------------------------------------
 *     Functions
 *----------------------------------------------------------------------------*/

void DIAG_COMMON_UpdateErrorStatus(uint32_t errStatus);
uint32_t DIAG_COMMON_GetErrorStatus(void);
void DIAG_COMMON_ResetErrorStatus(void);
DIAG_STATUS DIAG_COMMON_REG_WriteProtection(uint32_t periphBase, DIAG_WP_MODE_REG wpInfo, const DIAG_REG_INFO *diagRegs, uint32_t numReg);
DIAG_STATUS DIAG_COMMON_REG_Reset(uint32_t periphBase, const DIAG_REG_RESET_INFO *regInfo, uint8_t numReg);
DIAG_STATUS DIAG_COMMON_REG_WriteRead(uint32_t periphBase, const DIAG_REG_INFO *regInfo, uint8_t numReg);
int DIAG_COMMON_memcmp(const void *data1, const void *data2, size_t size);
void DIAG_COMMON_memset(void *data, char ch, size_t size);
bool DIAG_COMMON_IsInRange(uint32_t value, uint32_t refValue, uint8_t plusOrMinus);

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif
// DOM-IGNORE-END
#endif // DIAG_COMMON_H
