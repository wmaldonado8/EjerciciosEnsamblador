%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	
	resultado db "El mumero que mas se repite es: "
	len_r equ $-resultado
	
	espacio db 10
	len_espacio equ $-espacio

	
	contador db '0000000000'
	
	archivo db "/home/walter/Documentos/Ensamblador/practicaPrueba/numeros.txt",0
	archivo2 db "/home/walter/Documentos/Ensamblador/practicaPrueba/moda.txt",0

section .bss
	texto resb 10
	respuesta resb 1
	numero resb 1
	aux1 resb 1
	aux2 resb 1
	mayor resb 1
	idarchivo resb 1 

section .text
	global _start
	
	
_start:
	mov eax, 5
	mov ebx, archivo
	mov ecx, 0
	mov edx, 0
	int 80h
		
	test eax,eax
	jz salir	
	
	mov dword[idarchivo], eax
	
	mov eax, 3
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 10
	int 80h
	
	mov eax, 6
	mov ebx, [idarchivo]
	mov ecx, 0
	mov edx, 0 
	int 80h
	
	mov esi, 0
	mov ecx, 10
	
	ciclo_comparar:
		mov edi, esi
		cmp esi, 9
		jb ciclo
		mov esi, 0
		mov bl, 0
		jmp comparar
	
		
	
	ciclo:
		cmp esi, edi
		jz saltar
		
		mov al, [texto + esi]
		mov bl, [texto + edi]
		cmp al, bl
		jz imprimir_iguales
		
		inc edi
		
		cmp edi,10
		jb ciclo
		
		inc esi
		jmp ciclo_comparar
	
	saltar: 
		inc edi
		cmp edi,10
		jb ciclo
		
		inc esi
		jmp ciclo_comparar
		
	imprimir_iguales: 
		mov al,[contador + esi]
		inc al
		mov [contador + esi], al
		
		inc edi
		cmp edi,10
		jb ciclo
		
		inc esi
		jmp ciclo_comparar
	
	
	comparar:
		mov al, [contador+esi]
		cmp al,bl
		jb bucle
		mov bl,al
		mov al,[texto+esi]
		mov [mayor],al
	
	bucle: 
		inc esi
		cmp esi,10
		jb comparar
	
	imprimir2: 
		
		imprimir resultado, len_r
		imprimir mayor, 1
		imprimir espacio, len_espacio
		
		
	mov eax, 8
	mov ebx, archivo2
	mov ecx, 1
	mov edx, 200h
	int 80h		
	
	test eax, eax
	jz salir
	
	mov dword[idarchivo], eax

	
	mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, mayor
	mov edx, 1
	int 80h
	
	mov eax, 6
	mov ebx, [idarchivo]
	mov ecx, 0
	mov edx, 0 
	int 80h
	
	salir: 	
		mov eax,1
		mov ebx,0
		int 80h
