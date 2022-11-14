global _start
_start:
    mov eax, 1      ; move intger 1 into general purpose register named eax
    mov ebx, 42     ; move integer 42 into register ebx
    int 0x80        ; performs interrup. processor is transferring control to an interrupt handler that we specified here, which is 0x80, which is a system call