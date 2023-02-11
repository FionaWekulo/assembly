section .bss
list3 resb 4

section .data
list1 db 4, 5, 3, 1
list2 db 2, 4, 4, 6
eol db 0xa
space db ' '

section .text
global _start
_start:
    
    
    mov ecx, 4
    mov edi, list1
    call printing
         
    call print_newline
        
    mov ecx, 4
    mov edi, list2
    call printing
    
    call add_lists
    
    call print_newline
    
    mov ecx, 4
    mov edi, list3
    call printing
    call print_newline
    
    exit:
    mov eax, 1
    int 0x80
    
printing:
    mov esi, ecx
    
    mov ecx, edi
    mov ebx, 1
    mov eax, 4
    mov edx, 1
    add [ecx], byte '0'
    int 0x80
    sub [ecx], byte '0'
    
    call print_space
    
    mov ecx, esi
    inc edi
    loop printing
    ret
    
    
add_lists:
    mov ecx, 4
    
    body:
    sub ecx, 1
    
    mov edi, list1
    add edi, ecx
    
    mov edx, list2
    add edx, ecx
    
    mov ebx, [edi]
    mov esi, [edx]
    add ebx, esi
    ;add [edi], [edx]
    
    mov eax, list3
    add eax, ecx
    
    mov [eax], ebx

    add ecx, 1
    loop body
    ret
    
print_newline:
    mov ecx, eol
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret
    
print_space:
    mov ecx, space
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret
