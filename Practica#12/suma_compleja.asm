%macro presentar 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h
%endmacro

section .data

msj db 'La resta es:',10
len equ $ -msj
num1 db '518'
num2 db '197'
resta db '  '

section .text
	global _start
_start:
	mov ecx,3 ;numero operaciones de resta
	mov esi,2 ;posicion del digito en cada cadena n1 y n2
	clc			;instruccion CF=0

ciclo_resta:
	mov al, [num1+esi]
	sbb al, [num2+esi]   ;suma el acarreo a resta en binario
	aas  ;ajusta la operacion binaria al sistema decimal.
	pushf            ;guarda en pila todos los valores de las banderas.

	or al,30h

	mov [resta+esi], al
	dec esi
	popf
	loop ciclo_resta
	presentar msj, len
	presentar resta, 3

	mov eax,1
	int 80h