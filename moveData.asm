.global _start
_start:
    mov r0, #30 ; put 30 in r0 (immediate addressing)
    mov r7, #1  ; put 1 into r7
    move r1, r0 ; moving between two registers, is called register direct addresing
    swi 0       ; software interact


; end