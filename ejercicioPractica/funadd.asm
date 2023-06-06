org 100h
section .text

;primero limpiamos AX para ver mejor que se guarda
mov AX, 0
mov Al, 10d
mov Bl, 5d
CALL sumaDeNumeros ;MANDANDO A LLAMAR A LA SUBRUTINA

int 20h


; creacion de la subrutina
sumaDeNumeros:
    ;metemos a la pila ax y bx
    push ax
    push bx

    add AL, BL ;sumamos lo que tenemos en al y bl

    mov cl, 0  ; contador para el bucle

    cmp AL, 20 ;comparamos si el resultado de la suma es mayor, igual o menor a 20
    JA imprimir  ; si AL es mayor o igual a 20, imprimir directamente JA= JUMP IF ABOVE
    JB incrementar  ; si AL es menor a 20, pasar a incrementar JB=JUMP IF BELOW

imprimir:
    CALL imprimirmsg
    ret

incrementar:
    add AL, 5 ;SUMAMOS 5 AL RESULTADO
    inc cl

    cmp AL, 20 ;VOLVEMOS A COMPARAR SI LA CONDICION SE CUMPLE
    jl incrementar  ; si AL es menor a 20, repetir el incremento

    CALL imprimir ;HASTA QUE NO SE CUMPLE NO LLAMAMOS A IMPRIMIR

    ret

imprimirmsg:
    mov AH, 09H
    LEA DX, msgigual
    int 21h

    ret

section .data
    msgigual db 'fin', 0
