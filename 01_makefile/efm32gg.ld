
/* Minimal linker file example */

MEMORY
{
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 1048576
	RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 131072
}

SECTIONS
{
  .text :
  {
    KEEP(*(.isr_vector))
    *(.text*)
  } > FLASH

  .bss :
  {
    __bss_start__ = .;
    *(.bss*)
    *(COMMON)
    __bss_end__ = .;
  } > RAM

  .heap :
  {
    __end__ = .;
    end = __end__;
    _end = __end__;
    *(.heap*)
    __HeapLimit = .;
  } > RAM
}

