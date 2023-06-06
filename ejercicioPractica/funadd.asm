org 100h
section .text

;primero limpiamos AX para ver mejor que se guarda 15 = F
mov AX, 0
mov Al, 15d
mov Bl, 5d
nop
CALL sumaDeNumeros ;MANDANDO A LLAMAR A LA SUBRUTINA


; creacion de la subrutina
sumaDeNumeros:
    push ax
    push bx

    add AL, BL
    
    pop BX 
    pop AX 
    
    ret
