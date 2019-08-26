section .data
	asignatura db 'Lenguaje Ensamblador',0xA
	ciclo db 'Sexto Ciclo B',0xA
	nombre db 'Walter Maldonado', 0xA
	
	len1 EQU $-asignatura  ;EQU  Una constante numérica.Una referencia de dirección (cualquier modo de direccionamiento). 3.  Cualquier combinación de símbolos y operaciones que generen un valor numérico. 4.  Otro  nombre  simbólico.  
	len2 EQU $-ciclo 
	len3 EQU $-nombre 
	
section .text
	global _start

_start:

	;Primera impresión
	mov eax, 04 	;ax define el tipo de operación (4 = write)
	mov ebx, 01	;bx define la unidad estándar --> caracteres verificar la salida
	mov ecx, asignatura	;en cx se almacena la referencia de la constante saludo para imprimir
	mov edx, len1	;dx define el número de caracteres que se va a imprimir
	int 80H	;interrupción --> verifica el ultimo valor de eax, ebx, ecx, edx

	mov eax, 1	; ax define el tipo de operacion (1=salir --> exit)
	mov ebx, 0
	int 80H

	;Segunda impresión
	mov eax, 04 	;ax define el tipo de operación (4 = write)
	mov ebx, 01	;bx define la unidad estándar --> caracteres
	mov ecx, ciclo	;en cx se almacena la referencia de la constante saludo para imprimir
	mov edx, len2	;dx define el número de caracteres que se va a imprimir
	int 80H	;interrupción --> verifica el ultimo valor de eax, ebx, ecx, edx

	mov eax, 1	; ax define el tipo de operacion (1=salir --> exit)
	mov ebx, 0
	int 80H

	;Tercera impresión
	mov eax, 04 	;ax define el tipo de operación (4 = write)
	mov ebx, 01	;bx define la unidad estándar --> caracteres
	mov ecx, nombre	;en cx se almacena la referencia de la constante saludo para imprimir
	mov edx, len3	;dx define el número de caracteres que se va a imprimir
	int 80H	;interrupción --> verifica el ultimo valor de eax, ebx, ecx, edx

	mov eax, 1	; ax define el tipo de operacion (1=salir --> exit)
	mov ebx, 0
