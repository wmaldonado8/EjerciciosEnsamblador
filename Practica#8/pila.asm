section	.data
   hola db '',13, 10
   len equ $-hola

   hola2 db '',13, 10
   len2 equ $-hola2


section .bss
resultado resb 10


section	.text
   global _start        
	
_start:	                

   mov eax,2
   push eax

   mov eax,6
   push eax

   mov eax,5
   push eax

   pop eax
   add eax,"0"
   mov [resultado],eax

   mov eax,4
   mov ebx,1
   mov ecx,resultado
   mov edx,10
   int 80H

   pop eax
   add eax,"0"
   mov [resultado],eax

   mov eax,4
   mov ebx,1
   mov ecx,resultado
   mov edx,10
   int 80H

   pop eax
   add eax,"0"
   mov [resultado],eax

   mov eax,4
   mov ebx,1
   mov ecx,resultado
   mov edx,10
   int 80H

   jmp salida

   salida:
   mov eax,1
   int 80H
