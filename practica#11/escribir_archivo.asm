%macro escribir 2
mov eax,4
mov ebx,2
mov ecx,%1
mov edx,%2
int 80H
%endmacro

section .data
	msj db "Escribir el archivo",10
	len equ $ -msj

	path db "/home/walter/Documentos/Ensamblador/practica#11/archivo1.txt",0


section .bss
texto resb 30
idarchivo resd 01

section .data
	global _start
_start:

	mov eax,8   ; servicio para crear y escribir en archivos
	mov ebx,path    ;
	mov ecx,2
	mov edx,777h
	int 80H

	test eax,eax      ;test es un and sin modificar sus operandos, solo modifica la bandera
	jz salir

	mov dword[idarchivo],eax  ;salva el idarchivo

	escribir msj,len


	

	mov eax,3
	mov ebx,2
	mov ecx,texto
	mov edx,15
	int 80H

	mov eax,4
	mov ebx,[idarchivo]
	mov ecx,texto
	mov edx,15

salir:
mov eax,1
int 80H