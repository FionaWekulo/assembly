section .data
msg db "hello kenya!", 0xa
msg_len equ $ -msg

section .text
    global _start
_start:
    mov edx, msg_len
    mov ecx, msg

    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, 1
    int 0x80