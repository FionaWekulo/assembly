section .data
var1 db 'hello kenya!', 0xa
len equ $ - var1

section .text
    global_start
_start:
    mov edx,len
    mov ecx,var1

    mov ebx,1
    mov eax,4
    int 0x80


    mov eax,1
    int 0x80



