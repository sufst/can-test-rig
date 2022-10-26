###############################################################################
#               :
#   File        :   Makefile
#               :
#   Author(s)   :   Tim Brewis (@t-bre, tab1g19@soton.ac.uk)
#               :
#   Description :   VCU makefile
#				:	- Generated by STM32CubeMX
#				:	- Modified by SUFST
#               :
###############################################################################

###############################################################################
# configuration
###############################################################################

TARGET = can-listener
BUILD_DIR = build
DEBUG = 1
C_STANDARD = c11

# defines
ALWAYS_C_DEFS = \
-DUSE_HAL_DRIVER \
-DSTM32F746xx

DEBUG_C_DEFS = \
-DDEBUG \

RELEASE_C_DEFS = \
-DCOMPETITION_MODE=1 \

DEBUG_ASM_DEFS = \

RELEASE_ASM_DEFS = \

# flags
ALWAYS_FLAGS = \
-Wall \
-Wextra \
-pedantic \
-Wno-unused-parameter \
-Werror=implicit-function-declaration \
-fdata-sections \
-ffunction-sections \

DEBUG_C_FLAGS =  $(ALWAYS_FLAGS) -std=$(C_STANDARD) -g -gdwarf-2
RELEASE_C_FLAGS = $(ALWAYS_FLAGS) -std=$(C_STANDARD) -s
DEBUG_ASM_FLAGS =  $(ALWAYS_FLAGS)
RELEASE_ASM_FLAGS = $(ALWAYS_FLAGS)

# optimisation
DEBUG_OPT = -O0 
RELEASE_OPT = -O3

# target
CPU = -mcpu=cortex-m7
FPU = -mfpu=fpv5-sp-d16
FLOAT_ABI = -mfloat-abi=hard
MCU = $(CPU) -mthumb $(FPU) $(FLOAT_ABI)

###############################################################################
# toolchain
###############################################################################
PREFIX = arm-none-eabi-

CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S

###############################################################################
# linker
###############################################################################

LDSCRIPT = src/STM32F746ZGTx_FLASH.ld
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) \
			-Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

###############################################################################
# sources
###############################################################################

C_SOURCES =  \
src/SUFST/Src/canl.c \
src/Core/Src/main.c \
src/Core/Src/stm32f7xx_it.c \
src/Core/Src/stm32f7xx_hal_msp.c \
src/Core/Src/system_stm32f7xx.c \
src/Core/Src/gpio.c \
src/Core/Src/can.c \
src/Core/Src/usart.c \
src/Core/Src/usb_otg.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_adc.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_adc_ex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc_ex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_flash.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_flash_ex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_gpio.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma_ex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr_ex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_cortex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_i2c.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_i2c_ex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_exti.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_can.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_tim.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_tim_ex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_uart.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_uart_ex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pcd.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pcd_ex.c \
src/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_usb.c \

ASM_SOURCES =  \
src/startup_stm32f746xx.s \

###############################################################################
# includes
###############################################################################

C_INCLUDES =  \
-Isrc/Core/Inc \
-Isrc/SUFST/Inc \
-Isrc/Drivers/STM32F7xx_HAL_Driver/Inc \
-Isrc/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy \
-Isrc/Drivers/CMSIS/Device/ST/STM32F7xx/Include \
-Isrc/Drivers/CMSIS/Include \

ASM_INCLUDES = 

###############################################################################
# defines
###############################################################################

ifeq ($(DEBUG), 1)
	C_DEFS = $(ALWAYS_C_DEFS) $(DEBUG_C_DEFS)
	ASM_DEFS = $(DEBUG_ASM_DEFS)
else
	C_DEFS = $(ALWAYS_C_DEFS) $(RELEASE_C_DEFS)
	ASM_DEFS = $(RELEASE_ASM_DEFS)
endif

###############################################################################
# flags
###############################################################################

ifeq ($(DEBUG), 1)
	OPT=$(DEBUG_OPT)
	CFLAGS=$(DEBUG_C_FLAGS)
else
	OPT=$(RELEASE_OPT)
	CFLAGS=$(RELEASE_C_FLAGS)
endif

ASFLAGS = $(MCU) $(ASM_DEFS) $(ASM_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections
CFLAGS += $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

###############################################################################
# objects
###############################################################################

# generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"

# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))

# list of ASM objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

###############################################################################
# targets
###############################################################################

# default build all
all: 
	make $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin \

# pre build
.PHONY: prebuild
prebuild:
	tput setaf 5; tput bold; echo "Compiling..."; tput sgr0

# C
$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) prebuild
	echo "$<"
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

# ASM
$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR) prebuild
	echo "$<"
	$(AS) -c $(CFLAGS) $< -o $@

# .elf 
$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	tput setaf 5; tput bold; echo; echo "Linking..."; tput sgr0
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@
	tput setaf 2;  echo "$@"; echo; tput sgr0

# .hex
$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR) prebuild
	$(HEX) $< $@

# .bin
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR) prebuild
	tput setaf 5; tput bold; echo "Creating binary..."; tput sgr0
	$(BIN) $< $@	
	tput setaf 2;  echo "$@"; echo; tput sgr0
	
# create build directory
$(BUILD_DIR):
	mkdir $@	

# clean
clean:
	tput setaf 5; tput bold; echo "Cleaning build directory..."
	-rm -fR $(BUILD_DIR)
	tput sgr0; tput setaf 2; echo "Done"; tput sgr0

# flash
flash: $(BUILD_DIR)/$(TARGET).bin
	tput setaf 5; tput bold; echo "Flashing..."; tput sgr0
	st-flash write $< 0x08000000
  
###############################################################################
# dependencies
###############################################################################

-include $(wildcard $(BUILD_DIR)/*.d)