
;loop 
;print 5 elements of an array
;but stop when  
; 3 is encountered. However the 3 is printed
;Exercise
;have two arrays of digits
;have another array that stores the result of adding the two elements at similar positions
;in the above two arrays
;print the two arrays and the result array i.e. array one 1st line, array 2 2nd line; result 3rd line
;Ensure the sum of digits does not exceed 9
;stop printing when 3 is encountered in either of the initial arrays 
;before the three and its corresponding values are printed
;you may have to use a jump in instruction rather than a loop instruction
;end of exercise


section .bss
list3 resb 5

section .data
list1 db 4, 5, 3, 1, 4
list2 db 2, 4, 4, 6, 3
tocomp db 3
eol db 0xa
space db ' '

section .text
global _start
_start:
    
    ;print first array
    mov ecx, 5
    mov edi, list1
    call printing   
    call print_newline
      
    ;print second array  
    mov ecx, 5
    mov edi, list2
    call printing
    call print_newline
    
    ;add the values in the two arrays
    call add_lists
    
    ;print the result array
    mov ecx, 5
    mov edi, list3
    call printing
    call print_newline
    
    
    exit:
    mov eax, 1
    int 0x80
    
printing:
    mov esi, ecx

call actualprint 
	
	mov ecx,esi
	inc edi
	cmp[edi-1], byte 3
	loopne printing
	ret
	
actualprint:
	cmp[edi], byte 3
	je endprint
    mov ecx, edi
    mov ebx, 1
    mov eax, 4
    mov edx, 1
    add [ecx], byte '0'
    int 0x80
    sub [ecx], byte '0'
    endprint:
    call print_space
    ret
    
    
    
add_lists:
    mov ecx, 5
    
    body:
    sub ecx, 1
    
    mov edi, list1
    add edi, ecx
    
    mov edx, list2
    add edx, ecx
    
    mov ebx, [edi]
    mov esi, [edx]
    add ebx, esi
   
    
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
