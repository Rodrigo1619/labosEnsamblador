org 100h
section .text

;limpiando SI Y DI
XOR SI, SI
XOR DI, DI
MOV word CX, 8d

iterar:
        MOV byte AL, [array+DI]
        MOV byte [0200h+SI], AL
        ADD byte [0210h], AL
        INC SI
        INC DI
        LOOP iterar
exit: 
        int 20h

section .data

array db 0,0,0,6,7,9,2,0