section .data

msj1 db "Ingrese numero1:	",
len1 equ $ -msj1

msj2 db  10,"Ingrese numero2:	",
len2 equ $ -msj2


resultado db 10,"La suma es:	",
len_p equ $ - resultado 

section .bss       ;bss para variables
a resb 1
b resb 1
suma resb 1 ; se reserva un espacion en la variable sin valor inicial 

section .text 
	global _start

_start:
; lectura y escritura de variables
	mov eax,4
	mov ebx,1
	mov ecx,msj1
	mov edx,len1
	int 80H

	mov eax,3
	mov ebx,2
	mov ecx,a
	mov edx,2
	int 80H

	mov eax,4
	mov ebx,1
	mov ecx,msj2
	mov edx,len2
	int 80H

	mov eax,3
	mov ebx,2
	mov ecx,b
	mov edx,2
	int 80H
;------------------------------------------

	;operaciones

	mov ax,[a]
	mov bx,[b]
	sub ax,'0' ;convierte cadena a numero
	sub ax,'0'
	add ax,bx 

	add ax,'0' ;convertir numero a cadena

	mov [suma],ax ;  corchetes para direccionar a un espacio de memoria indirecto
;--------------------------------------------

	;imprimir
	mov eax,4
	mov ebx,1
	mov ecx,resultado
	mov edx,len_p
	int 80H

	mov eax,4
	mov ebx,1
	mov ecx,suma
	mov ebx,1
	int 80H

	mov eax,1
	int 80H


	mov eax,1
	int 80H