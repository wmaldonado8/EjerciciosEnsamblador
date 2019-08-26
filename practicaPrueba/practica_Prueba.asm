%macro escribir 2
mov eax,4
mov ebx,2
mov ecx,%1
mov edx,%2
int 80H
%endmacro

section .data
	msj db "Leer el archivo",10
	len equ $ -msj

	salto db "",10
	len_salto equ $ -salto

	msj_sum db 10,'La suma es:'
	len_sum equ $ -msj_sum

	msj_resta db 10,'La resta es:'
	len_resta equ $ -msj_resta

	path db "/home/walter/Documentos/Ensamblador/practicaPrueba/arreglo.txt",0
	path2 db "/home/walter/Documentos/Ensamblador/practicaPrueba/repeticiones.txt",0

	resta db '  '
	sum db '   '

section .bss
num1 resb 3
num2 resb 3
idarchivo resd 01


section .text
	global _start
_start:
	mov ecx,3
	mov esi,2
	clc	
	;apertura del archivo


	mov eax,5    ;servicio para abrir el archivo   ID del archivo
	mov ebx,path  ;direccion del archivo
	mov ecx,0     ;modo de acceso,read only=0
	mov edx,0     ;permisos del archivo
	int 0x80      ;igual a int 80H


	test eax,eax
	jz salir
	; archivo sin excepciones

	mov dword [idarchivo],eax    ;respaldo idarchivo

	mov eax,3
	mov ebx,[idarchivo]
	mov ecx,num1
	mov edx,3
	int 80H


	;cerrar archivo
	mov eax,6    		;servicio para abrir el archivo
	mov ebx,[idarchivo]  	;direccion del archivo
	mov ecx,0     		;modo de acceso,read only=0
	mov edx,0     		;permisos del archivo
	int 0x80      		;igual a int 80H

	;----------------------------------------------------

	mov eax,5    ;servicio para abrir el archivo   ID del archivo
	mov ebx,path2  ;direccion del archivo
	mov ecx,0     ;modo de acceso,read only=0
	mov edx,0     ;permisos del archivo
	int 0x80      ;igual a int 80H


	test eax,eax
	jz salir
	; archivo sin excepciones

	mov dword [idarchivo],eax    ;respaldo idarchivo

	mov eax,3
	mov ebx,[idarchivo]
	mov ecx,num2
	mov edx,3
	int 80H

	escribir num1,3
	escribir salto, len_salto
	escribir num2,3


	;cerrar archivo
	mov eax,6    		;servicio para abrir el archivo
	mov ebx,[idarchivo]  	;direccion del archivo
	mov ecx,0     		;modo de acceso,read only=0
	mov edx,0     		;permisos del archivo
	int 0x80      		;igual a int 80H

	mov ecx,3 ;numero operaciones de resta
	mov esi,2 ;posicion del digito en cada cadena n1 y n2
	clc		
ciclo_suma:
	mov al, [num1+esi]
	adc al, [num2+esi]
	aaa
	pushf            ;guarda en pila todos los valores de las banderas.

	or al,30h

	mov [sum+esi], al
	dec esi
	popf
	loop ciclo_suma
	escribir msj_sum, len_sum
	escribir sum, 3

	mov ecx,3 ;numero operaciones de resta
	mov esi,2 ;posicion del digito en cada cadena n1 y n2
	clc		


salir:
mov eax,1
int 80H