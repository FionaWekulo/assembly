; ask the user to enter a number, 
; if the number is equal or less than 3 print small number
; if the number is greater than 3 but less than 7 print average number
; else print large number


section	.text
   global _start     
_start:	            

   ; Ask the user to enter a number

   mov ecx, msg0       ;msg to write
   
   ;message 0 length
   mov	edx,msg1      
   sub edx, ecx

   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel



   ; read input fom the user

   mov	edx,4     ;expected length of input
   mov	ecx,num     ;address to store input
   mov	ebx,2       ;file descriptor (stdin)
   mov	eax,3       ;system call number (sys_read)
   int	0x80        ;call kernel



   ; compare number to 3

   mov	eax,0     ;initialise eax so the higher 24 bits are zero
   mov al, [num]  
   sub al, '0'
   cmp eax,3

   jg average; if eax > 3. Do the jump to now compare it with 7



   ; situation when number is small - no jump above

   mov ecx,msg3 
   mov edx, len
   jmp printing



   ; compare num to 7

   average:
   mov	eax,0
   mov al, [num]
   sub al, '0'
   cmp eax,7;

   jge greater; if eax >= 7. Do the jump



   ; situation when number is average

   mov ecx,msg2
   mov edx, msg3
   sub edx, ecx
   jmp printing



   ; situation when number is greater than 7

   greater:	
   mov ecx, msg1
   mov edx, msg2
   sub edx, ecx
   


   ; print the message that was selected

   printing: 
   ;some registers are already setup for the system call during the selection 
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel	



   ; exit the program

   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel



section	.data
   msg0 db 'Enter a one digit number::'
   msg1 db 0xa,'Large number',0xa
   msg2 db 0xa,'Average number',0xa
   msg3 db 0xa, 'Small number', 0xa
   len equ $-msg3


section .bss
   num resb 1

