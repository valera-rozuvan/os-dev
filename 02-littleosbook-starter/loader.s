bits 32

section .text
    align 4
    dd 0x1BADB002               ; magic
    dd 0x00                     ; flags
    dd - (0x1BADB002 + 0x00)    ; checksum; m+f+c should be zero

global loader
extern sum_of_three
extern fb_write_cell

loader:                         ; the loader label (defined as entry point in linker script)
mov esp, kernel_stack           ;set stack pointer

push dword 3            ; arg3
push dword 2            ; arg2
push dword 1            ; arg1
call sum_of_three       ; call the function, the result will be in eax

;hlt                 ; shutdown

push dword 8
push dword 2
push dword 'h'
push dword 0
call fb_write_cell

push dword 8
push dword 2
push dword 'e'
push dword 16
call fb_write_cell

push dword 8
push dword 2
push dword 'l'
push dword 32
call fb_write_cell

push dword 8
push dword 2
push dword 'l'
push dword 48
call fb_write_cell

push dword 8
push dword 2
push dword 'o'
push dword 56
call fb_write_cell

.loop:
  jmp .loop        ; loop forever

section .bss
  align 4          ; align at 4 bytes
  resb 8192

kernel_stack:      ; label points to beginning of memory
