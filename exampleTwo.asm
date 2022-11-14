global _start

section .data
    msg db "hello there", 0x0a      ; 0x0a is new line character
    len equ $ - msg                 ; calculate length by subtracting location of the start of the string from the location after the string (end - start). this way you can change string and don't have to count the length again and again


section .text
_start:
    mov eax, 4      ; it's a system write call
    mov ebx, 1      ; stdout file descriptor
    mov ecx, msg    ; ecx holds the string pointer.  here says bytes to write
    mov edx, len    ; edx holds the string length.  here says number of bytes to write
    int 0x80        ; perform system call
    mov eax, 1      ; it's a system exit call
    mov ebx, 0      ; exit status 0, recall in C language int main() return 0
    int 0x80