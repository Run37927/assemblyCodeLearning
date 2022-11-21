global _start


section .data   ;define constant variables
; strings, magic numbers, terminating strings


section .bss
; reserving space in memory for future data


section .text
; _start:
; OR
; main:


-------------------------------------------
; to compile and run
; nasm -f elf32 -o example.o  example.asm
; ld -m elf_i386 -o example example.o
; ./example
-------------------------------------------


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



    ; flags register
    ; carry flag bit CF = carry (1 yes, 0 no)
    ; overflow flag OF
    ; zero flag ZF (1 yes, 0 no) 15 - 15 = 0
    ; sign flag SF (1 negative, 0 positive)
    ; parity flag PF (1 even, 0 odd)

    ; jump operation, jump to a specific label
    jmp label1      ; create program flow that isn't linear
    je label        ; jump equal. if the previous operation above this line results in two things equal each other, then jump
    jne label       ; jump not equal. if the two are not equal, jump
    jz              ; jump zero
    ; add n to get opposite
    jne             ; jump not zero
    jc              ; jump carry
    jo              ; jump overflow
    jg              ; jump greater than
    jge             ; jump greater than equal
    jl              ; jump less than
    jle             ; jump less than equal
    js              ; jump sign flag
    ja              ; jump above
    jae             ; jump above equal
    jb              ; jump below
    jbe             ; jump below equal

; call
call label      ; saves current location in your code so you can return back

; int a = 3
; int b = 4
; printf("hello")  call is used when the printf is being called. returns a pointer to this line of code

;-----------------------------------------------------------
cmp eax, ebx    ; compares eax - ebx. 大于0， 小于0， 等于0. Doesn't store anything, it updates the flag register

cmp eax, 25
ja label
; if eax > 25, jump. otherwise continue to do whatever

;-----------------shifting---------------------------
shr eax, 4      ; shift eax to the right by 4 bits, which means divide by 2 four times
shl eax, 2      ; shift eax to the left by 2 bits

sar             ; same as shift right except it will keep the sign
1111 0000
1111 1000  shift to right once, but kept the sign bit (for this negative number)

0100 0111
0010 0011  shift to right once, kept the sign bit (for positive number)

ror     ; rotate right
rol     ; rotate left
1111 0000
1110 0001 rotate left?
0111 1000 rotate right?

;--------------masking--------------------------------
1010 1010 since we only care about 10 in this number, we can use a mask, AND these two
0011 0000
---------
0010 0000 now I get what I care about, which is 10


eax = 1010 1010 1010 1010 1010 1010 1010 1010
and eax, 0xFFFF0000     ; AND with this hex num, store result in eax

1010 1010 1010 1010 1010 1010 1010 1010
1111 1111 1111 1111 0000 0000 0000 0000
---------------------------------------
1010 1010 1010 1010 0000 0000 0000 0000     ; result

shr eax, 16     ; shift eax to right by 16 bits
ax


------system calls-------
mov eax, 1
int 0x80    ;this is an interrupt
or this:
int 80h     ;this interrupt is going to raise a flag for the kernel, then kernel freeze, kernel thinks I need to handle this important event. kernel = processor


