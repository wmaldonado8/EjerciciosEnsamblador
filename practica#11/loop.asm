%macro escribir 2
mov eax,4
mov ebx,2
mov ecx,%1
mov edx,%2
int 80H
%endmacro

section .data
   mensaje      db    10,"Iniciar ciclos: ",10
   len_mensaje  equ      $ -mensaje

   nombre      db    10,"Realizado por: ",10
   len_nombre  equ      $ -nombre

   mensaje2     db    10,"Walter: "
   len_mensaje2  equ      $ -mensaje

   mensaje3      db    10,"Fin de ciclo: ",10
   len_mensaje3  equ      $ -mensaje3
   

section	.text
   global _start        
	
_start:	   

escribir mensaje,len_mensaje

escribir mensaje2,len_mensaje2

mov cx,5

L1:

push cx

escribir nombre,len_nombre

pop cx
loop L1

escribir mensaje3,len_mensaje3

mov eax,1
int 80H






