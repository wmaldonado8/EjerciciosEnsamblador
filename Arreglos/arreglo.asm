section .data
   mensaje      db    10,"Ingrese 5 # numeros y presione enter: ",10
   len_mensaje  equ      $ -mensaje

   arreglo db 0,0,0,0,0
   len_arreglo equ $ -arreglo

section .bss
resultado resb 2


section	.text
   global _start        
	
_start:	                

   mov esi,arreglo
   mov edi,0

   mov eax,4
   mov ebx,1
   mov ecx,mensaje
   mov edx,len_mensaje
   int 80H  


   leer:
   mov eax,3
   mov ebx,2
   mov ecx,resultado
   mov edx,2
   int 80H

   mov al,[resultado]
   sub al,'0' 

   mov [esi],al
   inc esi
   inc edi

   cmp edi,len_arreglo
   jb leer

   mov ecx,0

   imprimir:
   push ecx
   mov al,[arreglo+ecx]
   add al,'0'
   mov[resultado],al

   mov eax,4
   mov ebx,1
   mov ecx,resultado
   mov edx,1
   int 80H

   pop ecx
   inc ecx

   cmp ecx,len_arreglo
   jb imprimir

   salida:
   mov eax,1
   int 80H
