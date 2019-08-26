section .data

	

	;nueva_linea db 10,''
	;asterisco db '*'

	numero db "Ingrese valor: "
	leng_numero equ $-numero



	section .text 
global _start
_start:

	mov ecx,20
	mov ebx,1

l1:

	push ecx
	push ebx
	call imprimir_enter
	pop ecx
	mov ebx,ecx
	push ebx


l2:
	push ecx
	call imprimir_numero
	pop ecx
	loop l2                   ;ecx !=0       ;loop > decrementar
	pop ebx
	pop ecx
	inc ebx
	loop l1						;ecx !=0       ; se debe respaldar 4 valores en pila
;se termina el programa
	mov eax,1
	int 80h

imprimir_numero:

	mov eax,4
	mov ebx,1
	mov ecx,numero
	mov edx,1
	int 80h
	ret    
	

imprimir_enter:

	mov eax,4
	mov ebx,1
	mov ecx,nueva_linea
	mov edx,1
	int 80h
	ret                  ;retorna a la ultima linea del llamado
