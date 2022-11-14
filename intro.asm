global _start


section .data   ;define constant variables
; strings, magic numbers, terminating strings


section .bss
; reserving space in memory for future data


section .text
; _start:
; OR
; main:



; to compile and run
; nasm -f elf32 -o example.o  example.asm
; ld -m elf_i386 -o example example.o
; ./example



_start:
    mov dest, src       ; move source to destination
    movzx eax, 3        ; put binary version of 3 (11) into a 32-bit register, it's gonna zero out the rest 30 bits
    movzx eax, byte ptr [ebx]   ; grab one byte from the address stored in ebx, ebx could be an array, and we want only one byte, but eax is 4B (4*8 = 32 bits), so we zero out the unused bytes in eax
    movsx dest, src     ; sign extend. if you put a negative number that's only 1B in size, but you have a 4B register, it's gonna sign extend up to the end of that register

    ; bitwise operations
    and dest, src   ; and dest and src, store in dest
    OR              ; same thing
    xor             ; same thing
    test eax, eax   ; check whether eax = 0, won't change the value of eax

    ; arithmetic operation
    add eax, ebx    ; eax += ebx
    sub eax, 15     ; eax -= 15

    mov ax, 15
    mul bx          ; dx:ax = ax * bx
    ; multiply 2 16-bit registers might result in more than 16 bit in size, the lower 16-bit of the result will be stored in ax, upper in dx

    div bx          ; ax % dx = dx:ax / bx
    ; dx:ax might be 32-bit value, i want to divide by a 16-bit, result be stored in ax, and remainder stored in dx

    