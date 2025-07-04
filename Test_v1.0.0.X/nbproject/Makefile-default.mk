#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Test_v1.0.0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Test_v1.0.0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/default/diagnostic/common/diag_common.c ../src/config/default/diagnostic/uart/diag_uart_switcher.c ../src/config/default/diagnostic/uart/diag_uart.c ../src/config/default/peripheral/aic/plib_aic.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/matrix/plib_matrix.c ../src/config/default/peripheral/mmu/plib_mmu.c ../src/config/default/peripheral/pio/plib_pio.c ../src/config/default/peripheral/uart/plib_uart0.c ../src/config/default/safe_peripheral/common/plib_common.c ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/fault_handlers.c ../src/config/default/initialization.c ../src/config/default/cstartup.S ../src/config/default/interrupts.c ../src/main.c ../src/config/default/safe_peripheral/uart/plib_uart0.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1222143438/diag_common.o ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o ${OBJECTDIR}/_ext/505776171/diag_uart.o ${OBJECTDIR}/_ext/60163497/plib_aic.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1666157715/plib_matrix.o ${OBJECTDIR}/_ext/60175171/plib_mmu.o ${OBJECTDIR}/_ext/60177924/plib_pio.o ${OBJECTDIR}/_ext/1865657120/plib_uart0.o ${OBJECTDIR}/_ext/2061166547/plib_common.o ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/fault_handlers.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/cstartup.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1621872/plib_uart0.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1222143438/diag_common.o.d ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o.d ${OBJECTDIR}/_ext/505776171/diag_uart.o.d ${OBJECTDIR}/_ext/60163497/plib_aic.o.d ${OBJECTDIR}/_ext/60165520/plib_clk.o.d ${OBJECTDIR}/_ext/1666157715/plib_matrix.o.d ${OBJECTDIR}/_ext/60175171/plib_mmu.o.d ${OBJECTDIR}/_ext/60177924/plib_pio.o.d ${OBJECTDIR}/_ext/1865657120/plib_uart0.o.d ${OBJECTDIR}/_ext/2061166547/plib_common.o.d ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1171490990/fault_handlers.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/cstartup.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1621872/plib_uart0.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1222143438/diag_common.o ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o ${OBJECTDIR}/_ext/505776171/diag_uart.o ${OBJECTDIR}/_ext/60163497/plib_aic.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1666157715/plib_matrix.o ${OBJECTDIR}/_ext/60175171/plib_mmu.o ${OBJECTDIR}/_ext/60177924/plib_pio.o ${OBJECTDIR}/_ext/1865657120/plib_uart0.o ${OBJECTDIR}/_ext/2061166547/plib_common.o ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/fault_handlers.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/cstartup.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1621872/plib_uart0.o

# Source Files
SOURCEFILES=../src/config/default/diagnostic/common/diag_common.c ../src/config/default/diagnostic/uart/diag_uart_switcher.c ../src/config/default/diagnostic/uart/diag_uart.c ../src/config/default/peripheral/aic/plib_aic.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/matrix/plib_matrix.c ../src/config/default/peripheral/mmu/plib_mmu.c ../src/config/default/peripheral/pio/plib_pio.c ../src/config/default/peripheral/uart/plib_uart0.c ../src/config/default/safe_peripheral/common/plib_common.c ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/fault_handlers.c ../src/config/default/initialization.c ../src/config/default/cstartup.S ../src/config/default/interrupts.c ../src/main.c ../src/config/default/safe_peripheral/uart/plib_uart0.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core_A/Include"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Test_v1.0.0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAMA5D29
MP_LINKER_FILE_OPTION=,--script="..\src\config\default\ddr.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1171490990/cstartup.o: ../src/config/default/cstartup.S  .generated_files/flags/default/f79792798750b82a7ce98188461a5039c6e3d121 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/cstartup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/cstartup.o 
	@${RM} ${OBJECTDIR}/_ext/1171490990/cstartup.o.ok ${OBJECTDIR}/_ext/1171490990/cstartup.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1171490990/cstartup.o.d"  -o ${OBJECTDIR}/_ext/1171490990/cstartup.o ../src/config/default/cstartup.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1171490990/cstartup.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/cstartup.o.d" "${OBJECTDIR}/_ext/1171490990/cstartup.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1171490990/cstartup.o: ../src/config/default/cstartup.S  .generated_files/flags/default/6051f9be976ac6a54277186294e817e933c97a84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/cstartup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/cstartup.o 
	@${RM} ${OBJECTDIR}/_ext/1171490990/cstartup.o.ok ${OBJECTDIR}/_ext/1171490990/cstartup.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1171490990/cstartup.o.d"  -o ${OBJECTDIR}/_ext/1171490990/cstartup.o ../src/config/default/cstartup.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1171490990/cstartup.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/cstartup.o.d" "${OBJECTDIR}/_ext/1171490990/cstartup.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1222143438/diag_common.o: ../src/config/default/diagnostic/common/diag_common.c  .generated_files/flags/default/8972c5518ccd06dab3de5e6c9a81f432816edad5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1222143438" 
	@${RM} ${OBJECTDIR}/_ext/1222143438/diag_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1222143438/diag_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1222143438/diag_common.o.d" -o ${OBJECTDIR}/_ext/1222143438/diag_common.o ../src/config/default/diagnostic/common/diag_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o: ../src/config/default/diagnostic/uart/diag_uart_switcher.c  .generated_files/flags/default/ce10d53d79521bc380875b594a6e9165ea9c0f4d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505776171" 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o.d 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o.d" -o ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o ../src/config/default/diagnostic/uart/diag_uart_switcher.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/505776171/diag_uart.o: ../src/config/default/diagnostic/uart/diag_uart.c  .generated_files/flags/default/f1b20846718f9c68448bb074d0864170c25c707d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505776171" 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/505776171/diag_uart.o.d" -o ${OBJECTDIR}/_ext/505776171/diag_uart.o ../src/config/default/diagnostic/uart/diag_uart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60163497/plib_aic.o: ../src/config/default/peripheral/aic/plib_aic.c  .generated_files/flags/default/c24496a6df6c61e12da24ce462b2883683d21bfd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163497" 
	@${RM} ${OBJECTDIR}/_ext/60163497/plib_aic.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163497/plib_aic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60163497/plib_aic.o.d" -o ${OBJECTDIR}/_ext/60163497/plib_aic.o ../src/config/default/peripheral/aic/plib_aic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/50841539eeabe2ace71dc5ba22a8d0e4c0866d2c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1666157715/plib_matrix.o: ../src/config/default/peripheral/matrix/plib_matrix.c  .generated_files/flags/default/7db78ce65bda6786c35a0fa68ae1fe447ec6a533 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1666157715" 
	@${RM} ${OBJECTDIR}/_ext/1666157715/plib_matrix.o.d 
	@${RM} ${OBJECTDIR}/_ext/1666157715/plib_matrix.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1666157715/plib_matrix.o.d" -o ${OBJECTDIR}/_ext/1666157715/plib_matrix.o ../src/config/default/peripheral/matrix/plib_matrix.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60175171/plib_mmu.o: ../src/config/default/peripheral/mmu/plib_mmu.c  .generated_files/flags/default/a752ffe2030fa5cd7c41bbf35ccde0c76e02a26b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60175171" 
	@${RM} ${OBJECTDIR}/_ext/60175171/plib_mmu.o.d 
	@${RM} ${OBJECTDIR}/_ext/60175171/plib_mmu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60175171/plib_mmu.o.d" -o ${OBJECTDIR}/_ext/60175171/plib_mmu.o ../src/config/default/peripheral/mmu/plib_mmu.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60177924/plib_pio.o: ../src/config/default/peripheral/pio/plib_pio.c  .generated_files/flags/default/c6df1d431a86988f8e533d3446e83edecd0d1e00 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60177924" 
	@${RM} ${OBJECTDIR}/_ext/60177924/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/60177924/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60177924/plib_pio.o.d" -o ${OBJECTDIR}/_ext/60177924/plib_pio.o ../src/config/default/peripheral/pio/plib_pio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865657120/plib_uart0.o: ../src/config/default/peripheral/uart/plib_uart0.c  .generated_files/flags/default/259104eac640deaf33ff41b9b37574506976455b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart0.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart0.o ../src/config/default/peripheral/uart/plib_uart0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2061166547/plib_common.o: ../src/config/default/safe_peripheral/common/plib_common.c  .generated_files/flags/default/738b2318e6a8ef7fbc6efbc0eceec877fe44aa9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2061166547" 
	@${RM} ${OBJECTDIR}/_ext/2061166547/plib_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/2061166547/plib_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2061166547/plib_common.o.d" -o ${OBJECTDIR}/_ext/2061166547/plib_common.o ../src/config/default/safe_peripheral/common/plib_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/47423391/plib_xdmac0.o: ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c  .generated_files/flags/default/77d63f67ae2c611994727430a50bc2679f33628c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47423391" 
	@${RM} ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o.d 
	@${RM} ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47423391/plib_xdmac0.o.d" -o ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/c690be40d1e450faf5f28d2fda10a191a4dd4caf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/fault_handlers.o: ../src/config/default/fault_handlers.c  .generated_files/flags/default/662cc2b805cc917484fa794044852ea145605704 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/fault_handlers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/fault_handlers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/fault_handlers.o.d" -o ${OBJECTDIR}/_ext/1171490990/fault_handlers.o ../src/config/default/fault_handlers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/e2f5f583b967e8ea62dbecea0aab9f1ecef21524 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/bab3754f9af330b2d8d681dd1221dd773e69543b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/d0b3ff792bb210403538b6369140c2410c18e41b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1621872/plib_uart0.o: ../src/config/default/safe_peripheral/uart/plib_uart0.c  .generated_files/flags/default/8c5ab9a5513600409b29d3644a443190a7e98bd8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1621872" 
	@${RM} ${OBJECTDIR}/_ext/1621872/plib_uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1621872/plib_uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1621872/plib_uart0.o.d" -o ${OBJECTDIR}/_ext/1621872/plib_uart0.o ../src/config/default/safe_peripheral/uart/plib_uart0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1222143438/diag_common.o: ../src/config/default/diagnostic/common/diag_common.c  .generated_files/flags/default/6a818fa6a6ee19812c3dc82073ac67b5b042cf42 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1222143438" 
	@${RM} ${OBJECTDIR}/_ext/1222143438/diag_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1222143438/diag_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1222143438/diag_common.o.d" -o ${OBJECTDIR}/_ext/1222143438/diag_common.o ../src/config/default/diagnostic/common/diag_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o: ../src/config/default/diagnostic/uart/diag_uart_switcher.c  .generated_files/flags/default/3c2be8d6137b818ec596d9a4f534c8542974353b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505776171" 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o.d 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o.d" -o ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o ../src/config/default/diagnostic/uart/diag_uart_switcher.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/505776171/diag_uart.o: ../src/config/default/diagnostic/uart/diag_uart.c  .generated_files/flags/default/37f6d6b3ef2780c5db23b7573baee219fd5ae79e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505776171" 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/505776171/diag_uart.o.d" -o ${OBJECTDIR}/_ext/505776171/diag_uart.o ../src/config/default/diagnostic/uart/diag_uart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60163497/plib_aic.o: ../src/config/default/peripheral/aic/plib_aic.c  .generated_files/flags/default/ca2cf4c64e59fd9ac8348477e6dd77c9b3a69db2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163497" 
	@${RM} ${OBJECTDIR}/_ext/60163497/plib_aic.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163497/plib_aic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60163497/plib_aic.o.d" -o ${OBJECTDIR}/_ext/60163497/plib_aic.o ../src/config/default/peripheral/aic/plib_aic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/e772d6f2e69e39f101727c7d6c9da31a9b76d757 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1666157715/plib_matrix.o: ../src/config/default/peripheral/matrix/plib_matrix.c  .generated_files/flags/default/d126f7d4919d39de89e9a8abf95f6236c6572f2b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1666157715" 
	@${RM} ${OBJECTDIR}/_ext/1666157715/plib_matrix.o.d 
	@${RM} ${OBJECTDIR}/_ext/1666157715/plib_matrix.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1666157715/plib_matrix.o.d" -o ${OBJECTDIR}/_ext/1666157715/plib_matrix.o ../src/config/default/peripheral/matrix/plib_matrix.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60175171/plib_mmu.o: ../src/config/default/peripheral/mmu/plib_mmu.c  .generated_files/flags/default/7c04188bd390099cd151ca6639eafa1a465b81ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60175171" 
	@${RM} ${OBJECTDIR}/_ext/60175171/plib_mmu.o.d 
	@${RM} ${OBJECTDIR}/_ext/60175171/plib_mmu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60175171/plib_mmu.o.d" -o ${OBJECTDIR}/_ext/60175171/plib_mmu.o ../src/config/default/peripheral/mmu/plib_mmu.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60177924/plib_pio.o: ../src/config/default/peripheral/pio/plib_pio.c  .generated_files/flags/default/84d03a20d540a7f06e4c2ba6f396f1322466c296 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60177924" 
	@${RM} ${OBJECTDIR}/_ext/60177924/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/60177924/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60177924/plib_pio.o.d" -o ${OBJECTDIR}/_ext/60177924/plib_pio.o ../src/config/default/peripheral/pio/plib_pio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865657120/plib_uart0.o: ../src/config/default/peripheral/uart/plib_uart0.c  .generated_files/flags/default/f2a3b75cfb2f7189a98450ee9f7221426ab12167 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart0.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart0.o ../src/config/default/peripheral/uart/plib_uart0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2061166547/plib_common.o: ../src/config/default/safe_peripheral/common/plib_common.c  .generated_files/flags/default/d9e61c83499e1c94c163bbae4d3fc7f83a100456 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2061166547" 
	@${RM} ${OBJECTDIR}/_ext/2061166547/plib_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/2061166547/plib_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2061166547/plib_common.o.d" -o ${OBJECTDIR}/_ext/2061166547/plib_common.o ../src/config/default/safe_peripheral/common/plib_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/47423391/plib_xdmac0.o: ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c  .generated_files/flags/default/bb2aa7a5b29accb2a7c681abcaf7c56d434b3daa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47423391" 
	@${RM} ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o.d 
	@${RM} ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47423391/plib_xdmac0.o.d" -o ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/1429f041cb28d8939a049af0b56b2f3adbc6756c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/fault_handlers.o: ../src/config/default/fault_handlers.c  .generated_files/flags/default/4a31d91af1cf3e50fb0ae41f528af31227145ed8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/fault_handlers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/fault_handlers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/fault_handlers.o.d" -o ${OBJECTDIR}/_ext/1171490990/fault_handlers.o ../src/config/default/fault_handlers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/e1c23cae0cef49a8e18bb89b42db7e8dc842048 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/46f8e626894d37b7a5496058f7fac1959e3e1f62 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/7c491bb095480c3c1ef3f8d73ad59078db9ce6a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1621872/plib_uart0.o: ../src/config/default/safe_peripheral/uart/plib_uart0.c  .generated_files/flags/default/cbfb5fef7a922f57d49fdf3eec59879b1aafbda .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1621872" 
	@${RM} ${OBJECTDIR}/_ext/1621872/plib_uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1621872/plib_uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1621872/plib_uart0.o.d" -o ${OBJECTDIR}/_ext/1621872/plib_uart0.o ../src/config/default/safe_peripheral/uart/plib_uart0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Test_v1.0.0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/default/ddr.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/Test_v1.0.0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/Test_v1.0.0.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/default/ddr.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/Test_v1.0.0.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/Test_v1.0.0.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
