%macro presentar 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h
%endmacro

section .data

msj db 'La suma es:',10
len equ $ -msj
num1 db '518'
num2 db '197'
sum db '  '

section .text
	global _start
_start:
	mov ecx,3
	mov esi,2
	clc					;instruccion CF=0

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
	presentar msj, len
	presentar sum, 3

	mov eax,1
	int 80h