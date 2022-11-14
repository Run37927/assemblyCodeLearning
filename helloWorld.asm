; hello world
;
; author: hairun huang
; date: 14-Nov-2022

global _start

section .text:

_start:
    mov eax, 0x4            ; use the write sys call
    mov ebx, 1              ; use stdout as the file descriptor
    mov ecx, message        ; use the message as the buffer
    mov edx, message_length ; and supply the message length
    int 0x80                ; invoke the sys call

    ; now gracefully exit

    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .data:
    message: db "hello world!", 0xA
    message_length equ $-message