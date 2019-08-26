section .data
	a db "Ingrese valor de a: ", 10
	leng_a equ $ -a

	b db "Ingrese valor de b: ", 10
	leng_b equ $ -b

	presentar_no_igual db 10,"No son iguales: ",10
	leng_presentar_no_igual equ $ -presentar_no_igual
	
	presentar_igual db 10,"Son iguales: ",10
	leng_presentar_igual equ $ -presentar_igual

section .bss
	dato_a resb 10
	dato_b resb 10
	

section .text
	global _start
	global _igual
	global _noigual
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, a
	mov edx, leng_a
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, dato_a
	mov edx, 2;da la siguiente linea a leeer
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, b
	mov edx, leng_b
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, dato_b
	mov edx, 2
	int 80H


	mov eax, [dato_a]
	sub eax, '0'

	mov ebx, [dato_b]
	sub ebx, '0'

	cmp eax,ebx ;compara

	jz igual
	jmp no_igual

igual:
	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_igual
	mov edx, leng_presentar_igual
	int 80H

	jmp _salir

no_igual:
	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_no_igual
	mov edx, leng_presentar_no_igual
	int 80H
	jmp _salir
	
_salir:
	mov eax, 1
	mov ebx, 0
	int 80H