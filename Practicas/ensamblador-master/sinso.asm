USE16
ORG 0x7C00
	
jmp inicio

inicio:



mov al, "h"
mov ah, 0x0E
int 0x10

mov al, "o"
mov ah, 0x0E
int 0x10

mov al, "l"
mov ah, 0x0E
int 0x10

mov al, "a"
mov ah, 0x0E
int 0x10


mov al, "_"
mov ah, 0x0E
int 0x10

mov al, "m"
mov ah, 0x0E
int 0x10

mov al, "u"
mov ah, 0x0E
int 0x10

mov al, "n"
mov ah, 0x0E
int 0x10

mov al, "d"
mov ah, 0x0E
int 0x10

mov al, "o"
mov ah, 0x0E
int 0x10




hlt 
TIMES 510 - ($-$$) db 0
dw 0xAA55