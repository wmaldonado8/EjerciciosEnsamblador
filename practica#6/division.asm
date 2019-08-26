section .data
	a db "Ingrese valor de a: ", 10
	leng_a equ $ -a
	b db "Ingrese valor de b: **Debe ser menor que a**", 10
	leng_b equ $ -b
	presentar_cociente db "El cociente es: ", 10
	leng_presentar_cociente equ $ -presentar_cociente
	presentar_residuo db 10,"El residuo es: ", 10
	leng_presentar_residuo equ $ -presentar_residuo

section .bss
	dato_a resb 10
	dato_b resb 10
	cociente resb 10
	residuo resb 10

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

	mov al, [dato_a]
	sub al, '0'
	mov bl, [dato_b]
	sub bl, '0'
	div bl
	add ah, '0'
	add al, '0'

	mov [cociente], al
	mov [residuo], ah

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_cociente
	mov edx, leng_presentar_cociente
	int 80H



	;mov ebx, aL
	;add ebx,'0';convierte el numero a cadena


	mov eax, 4
	mov ebx, 1
	mov ecx, cociente
	mov edx, 1
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_residuo
	mov edx, leng_presentar_residuo
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, residuo
	mov edx, 1
	int 80H

	mov eax, 1
	mov ebx, 0
	int 80H
		