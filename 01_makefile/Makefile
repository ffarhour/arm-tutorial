#Simple makefile to demonstrate arm-none-eabi toolchain

CFLAGS=-std=c11 -O0 -g
LDFLAGS=-lc -lgcc -lnosys 

all: assemble compile link disassemble

assemble: main.c
	arm-none-eabi-gcc $(CFLAGS) main.c -mthumb -mcpu=cortex-m3 -c -S -o main.s

compile: main.c
	arm-none-eabi-gcc $(CFLAGS) main.c -mthumb -mcpu=cortex-m3 -c -o main.o

link: compile
	arm-none-eabi-ld -Tefm32gg.ld -Map=main.map main.o

reallink: compile
	arm-none-eabi-gcc -Xlinker $(LDFLAGS) -Tefm32gg.ld -Wl,-Map=main.map -Wl,--gc-sections main.o

disassemble: link
	arm-none-eabi-objdump -S --disassemble a.out

clean:
	rm *.o *.s *.dis *.out *.map