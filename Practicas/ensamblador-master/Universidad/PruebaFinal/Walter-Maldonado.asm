%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data

	msg db 10,"NUMERO A BUSCAR: "
	len equ $- msg

	resultado db " n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces"
	len_r equ $-resultado
	
	espacio db 10
	len_espacio equ $-espacio

	
	contador db '0000000000'
	
	archivo db "/home/walter/Documentos/Ensamblador/practicaPrueba/arreglo.txt",0
	archivo2 db "/home/walter/Documentos/Ensamblador/practicaPrueba/repeticiones.txt",0

section .bss
	texto resb 10
	idarchivo resb 1 
	car resb 2

section .text

lee:
	mov eax, 3 
	mov ebx, 0
	int 0x80
	ret

	global _start
	
	
_start:
	;-------------------

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


	;----------------------

	imprimir msg,len
	mov ecx, car  
	mov edx, 2
	call lee


	cld
	mov edi, texto
	mov ecx, 20
	mov eax, [car]

	;------------------------
	
	
	ciclo_comparar:
		mov edi, 0
		cmp esi, 10
		jb ciclo
		mov esi, 0
		mov al, 0
		mov cl, 0
		mov edi, 0
		jmp comparar_texto
	
	ciclo:
		mov al, [texto + esi]
		mov bl, [texto + edi]
		cmp al, bl
		jz igual
		
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
		
	igual: 
		mov al,[contador + esi]
		inc al
		mov [contador + esi], al
		
		inc edi
		cmp edi,10
		jb ciclo
		
		inc esi
		jmp ciclo_comparar
	
	
	comparar_texto:
		mov al, [texto+esi]
		cmp al,cl
		jz cambiar_texto
		inc cl
		jmp comparar_texto

	cambiar_texto:
		add edi, 1
		mov [resultado + edi], dword ecx
		add edi, 19
		
	bucle_texto: 
		inc esi
		mov cl, 0
		cmp esi,10
		jb comparar_texto
	
	
	mov esi, 0
	mov al, 0
	mov cl, 0
	mov edi, 0
	
	comparar_contador:
		mov al, [contador+esi]
		cmp al,cl
		jz cambiar_contador
		inc cl
		jmp comparar_contador
		
	cambiar_contador:
		add edi, 8
		mov [resultado + edi], dword ecx
		add edi, 12
		
	bucle_contador: 
		inc esi
		mov cl, 0
		cmp esi,10
		jb comparar_contador

		
		imprimir resultado, len_r
		imprimir espacio, len_espacio
		
		
	mov eax, 8
	mov ebx, archivo2
	mov ecx, 1
	mov edx, 200h
	int 80h		
	
	test eax, eax
	jz salir
	
	mov dword[idarchivo], eax

	mov eax, [resultado]
	mov [resultado], eax
	mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, resultado
	mov edx, len_r
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
