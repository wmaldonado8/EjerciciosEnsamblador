section .data

   numero      db    10,'Numero 1: ',0
   len_numero  equ      $ - numero


section .bss
num1 resb 10


section	.text
   global _start        
	
_start:	

	
	mov eax,4
   	mov ebx,1
   	mov ecx,numero
   	mov edx,len_numero
   	int 80H 

   	mov eax,3
   	mov ebx,2
   	mov ecx,num1
   	mov edx,2
   	int 80H 

   	

 

   	