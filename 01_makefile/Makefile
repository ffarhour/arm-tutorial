# Simple makefile to demonstrate arm-none-eabi toolchain
# This application /should/ run, but is not intended to be actually used
# Each step exists to show a stage of the usual (hopefully automated) build pipeline.

CFLAGS=-std=c11
#CFLAGS=-std=c11 -Os		# Enable optimization
#CFLAGS=-std=c11 -g			# Enable debug symbols
LDFLAGS=-lc -lgcc -lnosys 

all: assemble compile link disassemble

assemble: main.c
	@echo Assembling main.c -> main.s to show ARM assembly
	arm-none-eabi-gcc $(CFLAGS) main.c -mthumb -mcpu=cortex-m3 -c -S -o main.s

compile: main.c
	@echo Compiling main.c -> main.o
	arm-none-eabi-gcc $(CFLAGS) main.c -mthumb -mcpu=cortex-m3 -c -o main.o

link: compile
	@echo Linking main.o -> a.out, map output to main.map
	arm-none-eabi-ld -Tefm32gg.ld -Map=main.map --gc-sections main.o

real-link: compile
	@echo Linking main.o against standard libraries using the gcc linker passthrough
	arm-none-eabi-gcc -Xlinker $(LDFLAGS) -Tefm32gg.ld -Wl,-Map=main.map -Wl,--gc-sections main.o

disassemble: link
	@echo Dissasembling a.out
	arm-none-eabi-objdump -S --disassemble a.out

clean:
	@echo Cleaning directory
	rm *.o *.s *.dis *.out *.map
	