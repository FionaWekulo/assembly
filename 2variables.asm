section .text
global _start
_start:
mov edx,len
mov ecx,output1
mov ebx,1
mov eax,4
int 0x80

mov eax,1
int 0x80


mov edx,len2
mov ecx,output2
mov ebx,1
mov eax,4
int  0x80

mov eax,1
int 0x80

section .data
output1 db 'hello fiona!',0xa
output2 db 'hello kenya!',0xa
len equ $ -output1
len2 equ $ - output2
