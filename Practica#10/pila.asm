section	.data

   numero      db    10,'Numero 1: ',0
   len_numero  equ      $ - numero


section .bss
resultado resb 10


section	.text
   global _start        
	
_start:	                

   mov ecx,9
l1:

   push ecx
   add ecx,'0'
   mov [numero+8],dword ecx
   mov eax,4
   mov ebx,1
   mov ecx,numero
   mov edx,len_numero
   int 80H
   pop ecx
   loop l1

   jmp salida

   salida:
   mov eax,1
   int 80H
