
section	.data
   msg db '*'
   new_line db 10,''
  
section	.text
   global _start        
	
_start:	  
   mov ecx,9
   jmp principal

principal:
   cmp ecx,0
   jz salida
   jmp imprimir   

imprimir:
   dec ecx
   push ecx

   mov eax,4
   mov ebx,1
   mov ecx,msg
   mov edx,1
   int 80H

   pop ecx
   jmp principal

imprimir_enter:
   mov eax, 4
   mov ebx, 1
   mov ecx, new_line          
   mov edx, 1  
   int 80H

salida:
   mov eax,1
   int 80H
