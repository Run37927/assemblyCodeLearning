; INSTRUCTION POINTER 

; It's an internal pointer in the processor
; often labeled as EIP

; EIP holds the location of your machine code
; that the processor is executing

; EIP is changed by using jump operations

global _start


section .text
_start:
    mov ebx, 42     ; exit status is 42
    mov eax, 1      ; sys exit system call
    jmp skip        ; jump to "skip" label 
    mov ebx, 13     ; exit status is 13 (just to check is instruction pointer has been moved)

skip:
    int 0x80        ; interrupt the program