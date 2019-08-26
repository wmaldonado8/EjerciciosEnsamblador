;Realizar un programa en ensamblador que pida un numero del 1 al 5
;y determinar si es primo o no


section .data
	mensaje db 'No es primo', 10, 0
	len_mensaje equ $-mensaje

	mensaje1 db 'Es primo', 10 , 0
	len_mensaje1 equ $-mensaje1

	Ingreso db 'Ingrese un numero del 1 al 5', 10 , 0
	len_ingreso equ $-Ingreso
section .bss

	n1 resb 2

section .text
global _start
 
_start:

; Ingreso del numero
mov eax, 4
mov ebx, 1
mov ecx, Ingreso
mov edx, len_ingreso
int 80h

; Lectura del nombre

mov eax, 3
mov ebx, 2
mov ecx, n1
mov edx, 2
int 80h


jmp proceso

mov al, [n1]
add al, '0'
cmp al, '1'
jz proceso
cmp al, '2'
jz proceso
cmp al, '3'
jz proceso
cmp al, '4'
jz proceso
cmp al, '5'
jz proceso
jmp salir

proceso:
	mov al, [n1]
	sub al, '0'
	cmp al, 4
	je esprimo
	jz noprimo
	
noprimo:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje1
	mov edx, len_mensaje1
	int 80h
	jmp salir
	
esprimo:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len_mensaje
	int 80h
	jmp salir

salir:
mov eax,1
int 80h
