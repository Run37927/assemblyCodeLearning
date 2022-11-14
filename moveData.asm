.global _start
_start:
    mov r0, #30 ; put 30 in r0
    mov r7, #1  ; put 1 into r7
    swi 0       ; software interact


; end