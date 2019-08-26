section .data

msj db "La suma es:	",10
len equ $ -msj

section .bss       ;bss para variables
suma resb 10

section .text 
	global _start

_start:
	mov ax,2
	mov bx,5
	add ax,bx
	add ax,'0' ;convierte el numero a cadena
	;sub ax,'0' ; convierte cadena a numero

	mov [suma],ax ;  corchetes para direccionar a un espacio de memoria indirecto


	mov eax,4
	mov ebx,1
	mov ecx,msj
	mov edx,len
	int 80H

	;imprime
	mov eax,4
	mov ebx,1
	mov ecx,suma
	mov edx,1
	int 80H

	mov eax,1
	int 80H