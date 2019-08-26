section .data
	a db "Ingrese valor de a: ", 10
	leng_a equ $ -a
	b db "Ingrese valor de b: ", 10
	leng_b equ $ -b

	msj1 db "el resultado del cociente es: ",10
	len1 equ $-msj1 
	
	msj2 db 10,"el resultado del residuo es: ",10
	len2 equ $-msj2

	msj3 db 10,"No divisble: dividendo mayor a divisor ",10
	len3 equ $-msj3

	msj4 db 10,"No divisible división para cero ",10
	len4 equ $-msj4	

section .bss
	dato_a resb 10
	dato_b resb 10
	resultado_Al resb 1 
	resultado_Ah resb 1

section .text
	global _start
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

	;mov al, 8
	;mov bl, 3

	cmp bl,0
	jz noDivisibleCero

	cmp ax,bx
	jg noDivisibleMenor

	jmp division

noDivisibleCero:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj4
	mov edx, len4
	int 80h
	jmp salir

noDivisibleMenor:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj3
	mov edx, len3
	int 80h
	jmp salir

division:
	mov al, [dato_a]
	sub al, '0'
	mov bl, [dato_b]
	sub bl, '0'
	div bl
	add ah, '0'
	add al, '0'
	
	mov[resultado_Al], al
	mov[resultado_Ah], ah
	

	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h


	mov eax, 4
	mov ebx, 1
	mov ecx, resultado_Al
	mov edx, 1
	int 80h 


	mov eax, 4
	mov ebx, 1
	mov ecx, msj2
	mov edx, len2
	int 80h


	mov eax, 4
	mov ebx, 1
	mov ecx, resultado_Ah
	mov edx, 1
	int 80h 
	jmp salir

salir:
	mov eax, 1
	mov ebx, 1
	int 80H