section .data

msg db "*"
lengMsg equ $-msg

salto db "",10
lengSalto equ $-salto

dialog db "Ingrese tamaño de la matriz:"
lenDialog equ $-dialog


section .bss

num resb 10

section .text
global _start

_start:

mov eax,4
mov ebx,1
mov ecx,dialog
mov edx, lenDialog
int 80H

mov eax,3
mov ebx,2
mov ecx,num
mov edx,2
int 80H

mov al,[num]
sub eax,'0'

mov ecx,eax
push ecx
jmp columna


_columna:

mov eax,4
mov ebx,1
mov ecx,salto
mov edx,1
int 80H

pop ecx
cmp ecx,0
jz	salir
dec ecx
push ecx

mov al,[num]
sub eax,'0'

mov ecx,eax
push ecx
jmp fila

_salir:

