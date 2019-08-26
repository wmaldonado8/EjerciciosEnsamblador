section   .data

   
   par_msg  db  'Número par' 
   len1  equ  $ - par_msg 
   
   impar_msg db  'Número impar' 
   len2  equ  $ - impar_msg

section .text
   global _start            
	
_start:                     
   mov   ax, 9h           
   and   ax, 1             
   jz    par


   mov   eax, 4             
   mov   ebx, 1             
   mov   ecx, impar_msg      
   mov   edx, len2          
   int   0x80               
   jmp   impar

par:   
   mov   eax, 4             
   mov   ebx, 1             
   mov   ecx, par_msg      
   mov   edx, len1         
   int   0x80              

impar:
   mov   eax,1              
   int   0x80               