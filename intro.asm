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