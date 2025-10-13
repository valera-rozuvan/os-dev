ENTRY(_Reset)
SECTIONS
{
  . = 0x10000;
  .startup . : { startup.o(.text) }
  .text : { *(.text) }
  .data : { *(.data) }
  .bss : { *(.bss COMMON) }
  . = ALIGN(8);

  /* 4kB of stack memory
   * hexadecimal number 0x1000 is equal to 4096 in decimal
   **/
  . = . + 0x1000;

  stack_top = .;
}
