.global _start
_start:
    LDR r0, =list      ; load data from stack into register
    LDR r1, [r0]       ; get whats at r0, put into r1??
    LDR r2, [r0, #4]   ; takes value at r0, adds 4 to it, retrives value
    LDR r3, [r0, #8]!   ; pre increment with the !
    LDR r2, [r0], #4    ; post increment


.data
list:
    .word 4,5,13,8,7,-9
