org 100h
section .text

;primero limpiamos AX para ver mejor que se guarda 15 = F
mov AX, 0
mov Al, 15d
mov Bl, 5d
CALL sumaDeNumeros ;MANDANDO A LLAMAR A LA SUBRUTINA

int 20h


; creacion de la subrutina
sumaDeNumeros:
    push ax
    push bx

    add AL, BL

    CMP AL, 20 ;QUE COMPARE SI EL RESULTADO ES MAYOR A 20
    CALL imprimir
    ; si dejo el pop me los saca de la pila y al volver al main solo veo el f y no el 14
    ;pop BX 
    ;pop AX 
    
    ret

;si es igual, vamos a la direccion de memoria d100 para poder ver el mensaje
imprimir:
    mov AH, 09H
    LEA DX, msgigual
    int 21h

    ret


.data:
    msgigual db 'fin'