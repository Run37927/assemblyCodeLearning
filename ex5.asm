global _start

section .text

_start:
    mov ebx, 1      ; start ebx at 1
    mov ecx, 4      ; number of iterations
label:
    add ebx, ebx    ; doubling ebx
    dec ecx         ; decrement ecx by 1
    cmp ecx, 0      ; comapre ecx with 0
    jg label        ; jump to label if greater
    mov eax, 1      ; sys exit system call
    int 0x80