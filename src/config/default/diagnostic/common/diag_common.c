/*******************************************************************************
  SAMA5D29 Peripheral Diagnostics Library

  Company:
    Microchip Technology Inc.

  File Name:
    diag_common.c

  Summary:
    Source file for common diagnostics.

  Description:
    This file provides general functions used by multiple peripheral diagnostics.

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
#include "diag_common.h"

/*----------------------------------------------------------------------------
 *     Variables
 *----------------------------------------------------------------------------*/
static uint32_t diagErrorStatus = 0;
/*----------------------------------------------------------------------------
 *     Functions
 *----------------------------------------------------------------------------*/
/*============================================================================
void DIAG_COMMON_UpdateErrorStatus(uint32_t errStatus)
------------------------------------------------------------------------------
Purpose: Updates the global error status.
Input  : errStatus - New error status value.
Output : None.
Notes  : None.
============================================================================*/
void DIAG_COMMON_UpdateErrorStatus(uint32_t errStatus)
{
    diagErrorStatus = errStatus;
}

/*============================================================================
uint32_t DIAG_COMMON_GetErrorStatus(void)
------------------------------------------------------------------------------
Purpose: Returns the global error status.
Input  : None.
Output : Value of the error status variable.
Notes  : None.
============================================================================*/
uint32_t DIAG_COMMON_GetErrorStatus(void)
{
    return diagErrorStatus;
}

/*============================================================================
void DIAG_COMMON_ResetErrorStatus(void)
------------------------------------------------------------------------------
Purpose: Resets the global error status.
Input  : None.
Output : None.
Notes  : None.
============================================================================*/
void DIAG_COMMON_ResetErrorStatus(void)
{
    diagErrorStatus = 0;
}

/*============================================================================
DIAG_STATUS DIAG_COMMON_REG_WriteProtection(uint32_t periphBase,
    DIAG_WP_MODE_REG wpInfo, DIAG_REG_INFO * diagRegs, uint32_t numReg)
------------------------------------------------------------------------------
Purpose: Check whether write protection feature is working.
Input  : periphBase - Based address of the peripheral
         wpInfo - Details of the write protection registers
         diagRegs - Details about write protected registers
         numReg - number of registers to be checked
Output : Status of the diagnosis.
Notes  : None.
============================================================================*/
DIAG_STATUS DIAG_COMMON_REG_WriteProtection(uint32_t periphBase, DIAG_WP_MODE_REG wpInfo, const DIAG_REG_INFO *diagRegs, uint32_t numReg)
{
    DIAG_STATUS retVal = DIAG_STATUS_NOT_EXECUTED;
    uint32_t regData = 0;
    uint32_t i = 0;

    /* Disable write protection and check registers */
    *((volatile uint32_t *) (wpInfo.wpRegAddress)) = wpInfo.wpRegKey | PERIPH_WPMR_WPEN(0U);

    for (i = 0U; i < numReg; i++)
    {
        regData = *((volatile uint32_t *) (periphBase + diagRegs[i].regStatus));

        /* If the status register shows 0 for 'enabled' state, invert the value to process it further */
        if (diagRegs[i].statusInverted == true)
        {
            regData = ~regData;
        }
        else
        {
            /* Do Nothing */
        }
        
        /* If any of the register bits are set, write to the register which clears register bits */
        if ((regData & diagRegs[i].mask) != 0U)
        {
            /* If the same register is used to write and read back the status,
               write the 1s complement value of the mask, else write without complementing bits */
            if (diagRegs[i].regClear == diagRegs[i].regSet)
            {
                *((volatile uint32_t *) (periphBase + diagRegs[i].regClear)) &= ~(diagRegs[i].mask);
            }
            else
            {
                *((volatile uint32_t *) (periphBase + diagRegs[i].regClear)) |= diagRegs[i].mask;
            }

            regData = *((volatile uint32_t *) (periphBase + diagRegs[i].regStatus));

            if (diagRegs[i].statusInverted == true)
            {
                regData = ~regData;
            }
            else
            {
                /* Do Nothing */
            }
            
            if ((regData & diagRegs[i].mask) == 0U)
            {
                retVal = DIAG_STATUS_PASSED;
            }
            else
            {
                retVal = DIAG_STATUS_FAILED;
                break;
            }
        }
        else
        {
            *((volatile uint32_t *) (periphBase + diagRegs[i].regSet)) |= diagRegs[i].mask;

            regData = *((volatile uint32_t *) (periphBase + diagRegs[i].regStatus));

            if (diagRegs[i].statusInverted == true)
            {
                regData = ~regData;
            }
            else
            {
                /* Do Nothing */
            }
            
            if ((regData & diagRegs[i].mask) == diagRegs[i].mask)
            {
                retVal = DIAG_STATUS_PASSED;
            }
            else
            {
                retVal = DIAG_STATUS_FAILED;
                break;
            }
        }
    }
    if(retVal == DIAG_STATUS_PASSED)
    {
        /* Enable write protection and check registers */
        *((volatile uint32_t *) (wpInfo.wpRegAddress)) = wpInfo.wpRegKey | PERIPH_WPMR_WPEN(1U);

        for (i = 0U; i < numReg; i++)
        {
            regData = *((volatile uint32_t *) (periphBase + diagRegs[i].regStatus));

            if (diagRegs[i].statusInverted == true)
            {
                regData = ~regData;
            }
            else
            {
                /* Do Nothing */
            }
            
            if ((regData & diagRegs[i].mask) !=0U)
            {
                if (diagRegs[i].regClear == diagRegs[i].regSet)
                {
                    *((volatile uint32_t *) (periphBase + diagRegs[i].regClear)) &= ~(diagRegs[i].mask);
                }
                else
                {
                    *((volatile uint32_t *) (periphBase + diagRegs[i].regClear)) |= diagRegs[i].mask;
                }

                regData = *((volatile uint32_t *) (periphBase + diagRegs[i].regStatus));

                if (diagRegs[i].statusInverted == true)
                {
                    regData = ~regData;
                }
                else
                {
                    /* Do Nothing */
                }
                
                if ((regData & diagRegs[i].mask) != 0U)
                {
                   retVal = DIAG_STATUS_PASSED;
                }
                else
                {
                    retVal = DIAG_STATUS_FAILED;
                    break;
                }
            }
            else
            {
                *((volatile uint32_t *) (periphBase + diagRegs[i].regSet)) |= diagRegs[i].mask;

                regData = *((volatile uint32_t *) (periphBase + diagRegs[i].regStatus));

                if (diagRegs[i].statusInverted == true)
                {
                    regData = ~regData;
                }
                else
                {
                    /* Do Nothing */
                }
                
                if ((regData & diagRegs[i].mask) == 0U)
                {
                    retVal = DIAG_STATUS_PASSED;
                }
                else
                {
                    retVal = DIAG_STATUS_FAILED;
                    break;
                }
            }
        }
        /* Disable write protection before returning */
        *((volatile uint32_t *) (wpInfo.wpRegAddress)) = wpInfo.wpRegKey | PERIPH_WPMR_WPEN(0U);
    }
    else
    {
        /* Do nothing */
    }
    return retVal;
}

/*============================================================================
DIAG_STATUS DIAG_COMMON_REG_Reset(uint32_t periphBase,
   DIAG_REG_RESET_INFO *regInfo, uint8_t numReg)
------------------------------------------------------------------------------
Purpose: Check whether write protection feature is working.
Input  : periphBase - Based address of the peripheral
         regInfo - Reset value of REGs
         numReg - number of registers to be checked
Output : Status of the diagnosis.
Notes  : None.
============================================================================*/
DIAG_STATUS DIAG_COMMON_REG_Reset(uint32_t periphBase, const DIAG_REG_RESET_INFO *regInfo, uint8_t numReg)
{
    uint8_t i = 0;
    DIAG_STATUS retVal = DIAG_STATUS_NOT_EXECUTED;
    uint32_t regData = 0;

    for (i = 0U; i < numReg; i++)
    {
        regData = *((volatile uint32_t *) (periphBase + regInfo[i].regOffset));

        if (regData != regInfo[i].regDefaultValue)
        {
            retVal = DIAG_STATUS_FAILED;
            break;
        }
        else
        {
            /* Do Nothing */
        }
    }

    if  (i == numReg)
    {
        retVal = DIAG_STATUS_PASSED;
    }
    else
    {
        /* Do Nothing */
    }

    return retVal;
}

/*============================================================================
DIAG_STATUS DIAG_COMMON_REG_WriteRead(uint32_t periphBase,
    DIAG_REG_INFO *regInfo, uint8_t numReg)
------------------------------------------------------------------------------
Purpose: Check whether its possible to write and read REGs.
Input  : periphBase - Based address of the peripheral
         regInfo - Reset value of REGs
         numReg - number of registers to be checked
Output : Status of the diagnosis.
Notes  : None.
============================================================================*/
DIAG_STATUS DIAG_COMMON_REG_WriteRead(uint32_t periphBase, const DIAG_REG_INFO *regInfo, uint8_t numReg)
{
    DIAG_STATUS retVal = DIAG_STATUS_NOT_EXECUTED;
    uint32_t regData = 0;
    uint32_t i = 0;

    for (i = 0U; i < numReg; i++)
    {
        regData = *((volatile uint32_t *) (periphBase + regInfo[i].regStatus));

        if (regInfo[i].statusInverted == true)
        {
            regData = ~regData;
        }
        else
        {
            /* Do Nothing */
        }
        
        if ((regData & regInfo[i].mask) != 0U)
        {
            if (regInfo[i].regClear == regInfo[i].regSet)
            {
                *((volatile uint32_t *) (periphBase + regInfo[i].regClear)) &= ~regInfo[i].mask;
            }
            else
            {
                *((volatile uint32_t *) (periphBase + regInfo[i].regClear)) |= regInfo[i].mask;
            }

            regData = *((volatile uint32_t *) (periphBase + regInfo[i].regStatus));

            if (regInfo[i].statusInverted == true)
            {
                regData = ~regData;
            }
            else
            {
                /* Do Nothing */
            }
            
            if ((regData & regInfo[i].mask) == 0U)
            {
                retVal = DIAG_STATUS_PASSED;
            }
            else
            {
                retVal = DIAG_STATUS_FAILED;
                break;
            }
        }
        else
        {
            *((volatile uint32_t *) (periphBase + regInfo[i].regSet)) |= regInfo[i].mask;
 
            regData = *((volatile uint32_t *) (periphBase + regInfo[i].regStatus));

            if (regInfo[i].statusInverted == true)
            {
                regData = ~regData;
            }
            else
            {
                /* Do Nothing */
            }
            
            if ((regData & regInfo[i].mask) == regInfo[i].mask)
            {
                retVal = DIAG_STATUS_PASSED;
            }
            else
            {
                retVal = DIAG_STATUS_FAILED;
                break;
            }
        }
    }

    return retVal;
}

/*============================================================================
int DIAG_COMMON_memcmp(const void *data1, const void *data2, size_t size)
------------------------------------------------------------------------------
Purpose: Checks if value is in range of reference.
Input  : data1 - This is the pointer to a block of memory.
         data2 - This is the pointer to a block of memory.
         size - This is the number of bytes to be compared.
Output : Return the results by comparing the contents of source and destination 
         buffer.
Notes  : None.
============================================================================*/
int DIAG_COMMON_memcmp(const void *data1, const void *data2, size_t size)
{
    const int8_t *char_ptr1 = (const int8_t *)data1;
    const int8_t *char_ptr2 = (const int8_t *)data2;
    int8_t compareStatus = 0;
    size_t byteCount = 0;

    if((char_ptr1 != NULL) && (char_ptr2 != NULL) && (size > 0U))
    {
        while(byteCount < size)
        {
            if(char_ptr1[byteCount] != char_ptr2[byteCount])
            {
                compareStatus = char_ptr1[byteCount] - char_ptr2[byteCount];
                break;
            }
            else
            {
                /* Do Nothing */
            }
            byteCount++;
        }
        if(byteCount == size)
        {
            compareStatus = 0;
        }
        else
        {
            /* Do Nothing */
        }
    }
    else
    {
        compareStatus = -1;
    }

    return compareStatus;
}

/*============================================================================
void DIAG_COMMON_memset(void *data, char ch, size_t size)
------------------------------------------------------------------------------
Purpose: Checks if value is in range of reference.
Input  : data - This is a pointer to the block of memory to fill.
         ch - This is the value to be set. The value is passed as an int, 
              but the function fills the block of memory using the 
              unsigned char conversion of this value.
         size - This is the number of bytes to be set to the value.
Output : None.
Notes  : None.
============================================================================*/
void DIAG_COMMON_memset(void *data, char ch, size_t size)
{
    int8_t *char_ptr = (int8_t *)data;
    size_t byteCount = 0;

    if((char_ptr != NULL) && (size > 0U))
    {
        while(byteCount < size)
        {
            char_ptr[byteCount] = (	int8_t)ch;
            byteCount++;
        }
    }
    else
    {
        /* Do Nothing */
    }
}

/*============================================================================
bool DIAG_COMMON_IsInRange(uint32_t value, uint32_t refValue, uint8_t plusOrMinus)
------------------------------------------------------------------------------
Purpose: Checks if the actual value is within the allowed percentage of 
         the reference value.
Input  : value - The value to be checked for range.
         refValue - The reference value to be compared.
         plusOrMinus - Plus or minus percentage range for reference.
Output : bool - True if in range or false otherwise.
Notes  : None.
============================================================================*/
bool DIAG_COMMON_IsInRange(uint32_t value, uint32_t refValue, uint8_t plusOrMinus)
{
    bool retVal = false;
    uint32_t jitter = (uint32_t)((refValue * plusOrMinus ) / 100U);
    
    if(value >= (refValue - jitter) && value <= (refValue + jitter))
    {
        retVal = true;
    }
    else
    {
        /* Do Nothing */
    }
    
    return retVal;
}
