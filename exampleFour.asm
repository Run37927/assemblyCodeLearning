global _start

section .text

_start:
    mov ecx, 99     ; set ecx to 99
    mov ebx, 42     ; exit status is 42
    move eax, 1     ; sys exit system call
    cmp ecx, 100    ; compare ecp to 100
    jl skip        ; if ecx is < 100 then jump to skip
    mov ebx, 13     ; exit status is 13


skip:
    int 0x80



; exist status should be 13