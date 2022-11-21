; allocates a string on the stack, writes that to stdout

global _start

_start:
    sub esp, 4      ; basically allocates 4 bytes on the stack , esp is stack pointer
    mov [esp], byte 'H'
    mov [esp+1], byte 'e'
    mov [esp+2], byte 'y'
    mov [esp+3], byte '!'
    mov eax, 4      ;system write call
    mov ebx, 1      ;stdout file descriptor
    mov ecx, esp    ;pointer to bytes to write
    mov edx, 4      ;number of bytes to write
    int 0x80        ;perform system call
    mov eax, 1      ;system exit call
    mov ebx, 0      ;system status is 0
    int 0x80