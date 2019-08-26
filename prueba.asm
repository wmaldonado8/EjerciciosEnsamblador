
;pide primer número
mov ah,01
int 21
sub ah,01
sub al,30
mov cx,ax  ;lo respaldamos en cx
;Pide el segundo número
mov ah,01
int 21
sub ah,01
sub al,30
mov bx,ax  ;lo respaldamos en bx
aad  ;ajuste ascii para división
mov ax,cx  ;movemos el primer número a ax
mov cx,0000
mov dx,0000
div bx  ;Dividimos el contenido de ax entre bx (El resultado se guarda en al)
mov cx,dx ;El residuo se guarda en dl, lo respaldamos en cx
;Imprimimos el resultado
mov ah,02
mov dl,al
add dl,30
int 21
;imprimimos el residuo
mov ah,02
mov dl,cl
add dl,30
int 21
int 20


