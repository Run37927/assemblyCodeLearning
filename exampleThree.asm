section .data
    str db "hello world", 0xA   ; declare a byte (db), add new line
    len equ $ - str             ; get the length in bytes, is equal to some arithmetic operation
    ; str is a pointer, pointing at h in the "hello world"
    ; $ is current address is memory
    ; suppose h is at address 0xFF00
    ; current addres will be  0xFF0B
    ; FF0B - FF00 = B which is 11



; section .bss
; we don't need anything in bss right now

global _start
section .text
_start:
    mov eax, 4      ; i wanna use system write
    mov ebx, 1      ; i wanna use stdio
    mov ecx, str    ; i wanna move the pointer to the string hello world into ecx
    mov edx, len    ; edx holds the length
    int 0x80        ; interrupt?

    mov eax, 1      ; i wanna exit
    int 0x80        ; interrupt again?

;---------------more complicated down below------------
int x = 3
int a = 4
int b = 5
int c = 0

if (x == a) {
    c += a;
} else if (x == b) {
    c = b;
} else {
    c = 1;
}

now write equiv. assembly code
_start:
    eax x
    ebx a
    ecx b
    edx c

    cmp eax, ebx
    jne elseif      ; if eax and ebx are not equal, jump to the next condition which is elseif, which i made up
    add edx, ebx    ; otherwise add a to c

elseif:
    cmp eax, ecx
    jne else        ; if eax and ecx are not equal, jump to the next condition which is else, which i made up
    mov edx, ecx    ; otherwise assign b to c

else:
    mov edx, 1

;--------for loops----------
; int i;
; for (i = 0; i < 5; i ++) {
;     printf("%s ", i);
; }

-----write this way (the old c way) ------


now write the equiv. in assembly code
_start:
    ; eax, ebx, ecx, edx= system write
    ; edi = x
    
    --------the i = 0 part--------
    xor edi, edi        ; xor itself will zero things out. faster than clear

_loop1:
    -----the operation part----------
    add edi, '0'        ; if you add '0' to any single digit number, it will make the ascii version of that digit. now edi holds the ascii version of the counter x

    mov eax, 4          ; i wanna use system write
    mov ebx, 1          ; i wanna use stdio
    mov ecx, [edi]
    mov edx, 1
    int 0x80            ; print out the character version of the counter

    sub edi, '0'        ; subtract 0 from edi, back to number version of counter


    -------the increment part--------
    add edi, 1          ; increment by 1


    -------the conditional part-------
    cmp edi, 5
    jl loop1            ; if less than 5 (jl is jump less), go into loop1


    ; outside of loop


;suppose we have printf("this is a test %d %d %d", a, b, c)

extern printf

section .data
    msg db "this is a test %d %d %d"
    a db 3
    b db 5
    c db 9

section .text
_start:
    mov eax, [c]
    push eax
    push [b]
    push [a]
    push  msg

    call printf

    add esp, 16     ; clearing the stack of all the stuff we put on there

printf:
    push eax
    push ebx
    push ecx
    push edx

    ; put the old value ebp1 onto the stack
    ; when we push, esp auto increment to the next point in stack
    ; then move esp into ebp
    ; so esp and ebp both point to the same part
    push ebp
    mov ebp, esp

    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax
