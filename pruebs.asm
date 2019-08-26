section .data



section  .text

	global _start        
   
_start:        
;a
mov cx,05  ;número de datos a meter en este caso 5
mov ah,01
int 21
push ax  ;Metemos en la pila del registro ax, puede ser bx u otro registro
loop 103  ;Hacemos el ciclo para meter datos, se decrementa a cx en 1
mov cx,05 ;le damos el valor de 5 a cx para imprimir los datos, será otro ciclo
pop ax   ;Saca el ultimo valor metido a la pila
mov ah,02
mov dl,al  ;Se imprime el dato que se saco de la pila
int 21
loop 10d  ;repite el ciclo
int 20

mov eax,1
int 80H
;g
