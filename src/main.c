/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include <stdio.h>                     
#include <string.h>
#include "definitions.h"                // SYS function prototypes
#include "device.h"


#define RX_BUFFER_SIZE 3

#define LED_On()                        BLUE_Set()
#define LED_Off()                       BLUE_Clear()

// *****************************************************************************
// *****************************************************************************
// Section: Variables
// *****************************************************************************
// *****************************************************************************

char receiveBuffer[RX_BUFFER_SIZE];
char echoBuffer[3*RX_BUFFER_SIZE]; 

char messageStart[] = "**** UART echo interrupt demo ****\r\n"
                      "\t**** Pre-Use Diagnostics ****\r\n";
char messageError[] = "**** UART error occurred ****\r\n";

bool errorStatus = false;
bool writeStatus = false;
bool readStatus = false;

// *****************************************************************************
// *****************************************************************************
// Section: Functions
// *****************************************************************************
// *****************************************************************************

void APP_WriteCallback(uintptr_t context)
{
    writeStatus = true;
}

void APP_ReadCallback(uintptr_t context)
{
    if(PLIB_UART0_ErrorGet() != UART_ERROR_NONE)
    {
        /* ErrorGet clears errors, set error flag to notify console */
        errorStatus = true;
    }
    else
    {
        readStatus = true;
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    LED_On();
    
    /* Register callback functions and send start message */
    PLIB_UART0_WriteCallbackRegister(APP_WriteCallback, 0);
    PLIB_UART0_ReadCallbackRegister(APP_ReadCallback, 0);
    PLIB_UART0_Write((void *)&messageStart, sizeof(messageStart));
    
    while ( true )
    {
        if(errorStatus == true)
                {
                    /* Send error message to console */
                    errorStatus = false;
                    PLIB_UART0_Write(messageError, sizeof(messageError));
                }
            else if(readStatus == true)
            {
                /* Echo back received buffer and Toggle LED */
                readStatus = false;

                memcpy(echoBuffer, receiveBuffer, sizeof (receiveBuffer));
                memcpy(&echoBuffer[RX_BUFFER_SIZE], "\r\n", 2);            
                PLIB_UART0_Write(&echoBuffer, sizeof(echoBuffer));
                BLUE_Toggle();
            }
            else if(writeStatus == true)
            {
                /* Submit buffer to read user data */
                writeStatus = false;
                PLIB_UART0_Read(&receiveBuffer, sizeof(receiveBuffer));
            }
            else
            {
                /* Repeat the loop */
            }
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

