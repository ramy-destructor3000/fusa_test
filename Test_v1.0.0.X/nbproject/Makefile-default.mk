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
${OBJECTDIR}/_ext/1222143438/diag_common.o: ../src/config/default/diagnostic/common/diag_common.c  .generated_files/flags/default/dbc68421693ad43a6db7649275080066322af43 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1222143438" 
	@${RM} ${OBJECTDIR}/_ext/1222143438/diag_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1222143438/diag_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1222143438/diag_common.o.d" -o ${OBJECTDIR}/_ext/1222143438/diag_common.o ../src/config/default/diagnostic/common/diag_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o: ../src/config/default/diagnostic/uart/diag_uart_switcher.c  .generated_files/flags/default/8a18798c9c1898627027d8aea56b740a1608679c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505776171" 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o.d 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o.d" -o ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o ../src/config/default/diagnostic/uart/diag_uart_switcher.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/505776171/diag_uart.o: ../src/config/default/diagnostic/uart/diag_uart.c  .generated_files/flags/default/135995fa6777af1539ff1bbe26a15eebbe0ca0dc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505776171" 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/505776171/diag_uart.o.d" -o ${OBJECTDIR}/_ext/505776171/diag_uart.o ../src/config/default/diagnostic/uart/diag_uart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60163497/plib_aic.o: ../src/config/default/peripheral/aic/plib_aic.c  .generated_files/flags/default/b1d254ff8b1876b44d3beaee235c2cfcb32707f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163497" 
	@${RM} ${OBJECTDIR}/_ext/60163497/plib_aic.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163497/plib_aic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60163497/plib_aic.o.d" -o ${OBJECTDIR}/_ext/60163497/plib_aic.o ../src/config/default/peripheral/aic/plib_aic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/982db4d9e308be14c64d8b9468cdade5b24a3fd9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1666157715/plib_matrix.o: ../src/config/default/peripheral/matrix/plib_matrix.c  .generated_files/flags/default/4216106853ec6d53573d53cf581110330dbf8cd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1666157715" 
	@${RM} ${OBJECTDIR}/_ext/1666157715/plib_matrix.o.d 
	@${RM} ${OBJECTDIR}/_ext/1666157715/plib_matrix.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1666157715/plib_matrix.o.d" -o ${OBJECTDIR}/_ext/1666157715/plib_matrix.o ../src/config/default/peripheral/matrix/plib_matrix.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60175171/plib_mmu.o: ../src/config/default/peripheral/mmu/plib_mmu.c  .generated_files/flags/default/33fb57fa65ce04853a569b8a98804946b477efd4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60175171" 
	@${RM} ${OBJECTDIR}/_ext/60175171/plib_mmu.o.d 
	@${RM} ${OBJECTDIR}/_ext/60175171/plib_mmu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60175171/plib_mmu.o.d" -o ${OBJECTDIR}/_ext/60175171/plib_mmu.o ../src/config/default/peripheral/mmu/plib_mmu.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60177924/plib_pio.o: ../src/config/default/peripheral/pio/plib_pio.c  .generated_files/flags/default/b83a32ed0de5edc1f74e4a9bd33adf83cc71e415 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60177924" 
	@${RM} ${OBJECTDIR}/_ext/60177924/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/60177924/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60177924/plib_pio.o.d" -o ${OBJECTDIR}/_ext/60177924/plib_pio.o ../src/config/default/peripheral/pio/plib_pio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865657120/plib_uart0.o: ../src/config/default/peripheral/uart/plib_uart0.c  .generated_files/flags/default/423902a3feab78c0840f4e7b37fc525d1f9e8613 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart0.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart0.o ../src/config/default/peripheral/uart/plib_uart0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2061166547/plib_common.o: ../src/config/default/safe_peripheral/common/plib_common.c  .generated_files/flags/default/1e66f4e3f0fa0661ee9367290f524e4e587884ef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2061166547" 
	@${RM} ${OBJECTDIR}/_ext/2061166547/plib_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/2061166547/plib_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2061166547/plib_common.o.d" -o ${OBJECTDIR}/_ext/2061166547/plib_common.o ../src/config/default/safe_peripheral/common/plib_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/47423391/plib_xdmac0.o: ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c  .generated_files/flags/default/ca85d999131f11bc7ff2e78438020d5915fadfa3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47423391" 
	@${RM} ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o.d 
	@${RM} ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47423391/plib_xdmac0.o.d" -o ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/59d007d63cb65732c3502c313d6af6afd4bdb51a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/fault_handlers.o: ../src/config/default/fault_handlers.c  .generated_files/flags/default/5a0a438705c10afc746a15cf18c15d7a42aa984a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/fault_handlers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/fault_handlers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/fault_handlers.o.d" -o ${OBJECTDIR}/_ext/1171490990/fault_handlers.o ../src/config/default/fault_handlers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/d788d44c8220059bdeb081f421381d7b95fe187c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/b2af1417469e701f838dd5ac1e5ae38133a265c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/c1a13b1ad679220a6f084503c827e2b4b21f668c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1621872/plib_uart0.o: ../src/config/default/safe_peripheral/uart/plib_uart0.c  .generated_files/flags/default/6c5fdaf16157a6cbcc3192c02e4a9efdb0f2e48d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1621872" 
	@${RM} ${OBJECTDIR}/_ext/1621872/plib_uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1621872/plib_uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1621872/plib_uart0.o.d" -o ${OBJECTDIR}/_ext/1621872/plib_uart0.o ../src/config/default/safe_peripheral/uart/plib_uart0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1222143438/diag_common.o: ../src/config/default/diagnostic/common/diag_common.c  .generated_files/flags/default/48106ed42c1cdc763db949e63e2e4b9d99ad1215 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1222143438" 
	@${RM} ${OBJECTDIR}/_ext/1222143438/diag_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1222143438/diag_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1222143438/diag_common.o.d" -o ${OBJECTDIR}/_ext/1222143438/diag_common.o ../src/config/default/diagnostic/common/diag_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o: ../src/config/default/diagnostic/uart/diag_uart_switcher.c  .generated_files/flags/default/7b388570933002f5bc2e53f89a2de0e4c4053263 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505776171" 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o.d 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o.d" -o ${OBJECTDIR}/_ext/505776171/diag_uart_switcher.o ../src/config/default/diagnostic/uart/diag_uart_switcher.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/505776171/diag_uart.o: ../src/config/default/diagnostic/uart/diag_uart.c  .generated_files/flags/default/4c43c2d17199a7361cae6998baf2793354fbbd29 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505776171" 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/505776171/diag_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/505776171/diag_uart.o.d" -o ${OBJECTDIR}/_ext/505776171/diag_uart.o ../src/config/default/diagnostic/uart/diag_uart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60163497/plib_aic.o: ../src/config/default/peripheral/aic/plib_aic.c  .generated_files/flags/default/1043dfadc4279f347d872ccb23fe3e1f15aa60e3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163497" 
	@${RM} ${OBJECTDIR}/_ext/60163497/plib_aic.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163497/plib_aic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60163497/plib_aic.o.d" -o ${OBJECTDIR}/_ext/60163497/plib_aic.o ../src/config/default/peripheral/aic/plib_aic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/4a1b12b8500bfdd69d1dd02b5f67bc3d9fc9db6f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1666157715/plib_matrix.o: ../src/config/default/peripheral/matrix/plib_matrix.c  .generated_files/flags/default/b0ed71810df06cbeee70aebfed0cf94899fbb2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1666157715" 
	@${RM} ${OBJECTDIR}/_ext/1666157715/plib_matrix.o.d 
	@${RM} ${OBJECTDIR}/_ext/1666157715/plib_matrix.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1666157715/plib_matrix.o.d" -o ${OBJECTDIR}/_ext/1666157715/plib_matrix.o ../src/config/default/peripheral/matrix/plib_matrix.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60175171/plib_mmu.o: ../src/config/default/peripheral/mmu/plib_mmu.c  .generated_files/flags/default/5495cb95c9485eeedf70ae4d7a8862fef6d64fea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60175171" 
	@${RM} ${OBJECTDIR}/_ext/60175171/plib_mmu.o.d 
	@${RM} ${OBJECTDIR}/_ext/60175171/plib_mmu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60175171/plib_mmu.o.d" -o ${OBJECTDIR}/_ext/60175171/plib_mmu.o ../src/config/default/peripheral/mmu/plib_mmu.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60177924/plib_pio.o: ../src/config/default/peripheral/pio/plib_pio.c  .generated_files/flags/default/dbe5b09722c7b4b66d9ccd7310aeffa3471f1193 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60177924" 
	@${RM} ${OBJECTDIR}/_ext/60177924/plib_pio.o.d 
	@${RM} ${OBJECTDIR}/_ext/60177924/plib_pio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60177924/plib_pio.o.d" -o ${OBJECTDIR}/_ext/60177924/plib_pio.o ../src/config/default/peripheral/pio/plib_pio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865657120/plib_uart0.o: ../src/config/default/peripheral/uart/plib_uart0.c  .generated_files/flags/default/c1d304dbbec3c65c6d1efbb679b0fec9b84fdb5b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart0.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart0.o ../src/config/default/peripheral/uart/plib_uart0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2061166547/plib_common.o: ../src/config/default/safe_peripheral/common/plib_common.c  .generated_files/flags/default/a2e87f8ac89fc61939d9318dbeeef7b97635377b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2061166547" 
	@${RM} ${OBJECTDIR}/_ext/2061166547/plib_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/2061166547/plib_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2061166547/plib_common.o.d" -o ${OBJECTDIR}/_ext/2061166547/plib_common.o ../src/config/default/safe_peripheral/common/plib_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/47423391/plib_xdmac0.o: ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c  .generated_files/flags/default/7a265f0fedd85b94e222ee89f63dca502d872aa8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47423391" 
	@${RM} ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o.d 
	@${RM} ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47423391/plib_xdmac0.o.d" -o ${OBJECTDIR}/_ext/47423391/plib_xdmac0.o ../src/config/default/safe_peripheral/xdmac/plib_xdmac0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/3b6ef5a99029389b094627303c32a2105bd9e9c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/fault_handlers.o: ../src/config/default/fault_handlers.c  .generated_files/flags/default/a7cecde0411f28aedbcce461db076b3674bd8503 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/fault_handlers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/fault_handlers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/fault_handlers.o.d" -o ${OBJECTDIR}/_ext/1171490990/fault_handlers.o ../src/config/default/fault_handlers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/a4a0e3e65db98f974b6786e562aff58e29cfc404 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/a58dd1b68c0f032c7cdaca90423a42284cf302a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/b0f875b9f66f94205f6910a9d84d911b26cf9535 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1621872/plib_uart0.o: ../src/config/default/safe_peripheral/uart/plib_uart0.c  .generated_files/flags/default/a28d064ad0bcdacd7f3a445300a8a7e0e3a38351 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1621872" 
	@${RM} ${OBJECTDIR}/_ext/1621872/plib_uart0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1621872/plib_uart0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O0 -fno-common -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMA5D29_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core_A/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1621872/plib_uart0.o.d" -o ${OBJECTDIR}/_ext/1621872/plib_uart0.o ../src/config/default/safe_peripheral/uart/plib_uart0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -marm -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
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
