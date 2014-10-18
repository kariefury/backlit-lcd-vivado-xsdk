################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/backlitLCD.c \
../src/testperiph.c \
../src/xintc_tapp_example.c \
../src/xtmrctr_intr_example.c \
../src/xtmrctr_selftest_example.c 

LD_SRCS += \
../src/lscript.ld 

OBJS += \
./src/backlitLCD.o \
./src/testperiph.o \
./src/xintc_tapp_example.o \
./src/xtmrctr_intr_example.o \
./src/xtmrctr_selftest_example.o 

C_DEPS += \
./src/backlitLCD.d \
./src/testperiph.d \
./src/xintc_tapp_example.d \
./src/xtmrctr_intr_example.d \
./src/xtmrctr_selftest_example.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O2 -c -fmessage-length=0 -I../../backlitLCD_Demo_bsp/microblaze_0/include -mlittle-endian -mcpu=v9.3 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


