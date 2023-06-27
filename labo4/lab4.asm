org 100h
section .text

;llamado de las funciones
call Modotexto
call Movtexto1
call Escribirtexto1
call Movtexto2
call Escribirtexto2
call Movtexto3
call Escribirtexto3
call Finalizar

int 20h

section .data
msg1 db "ola camaron sin cola$"
msg2 db "eeee mesi$"
msg3 db "el que lo vea esto ess gei$"

;definiendo funciones

Modotexto:
    mov AH, 0h
    mov AL, 03h
    int 10h
    ret

Movtexto1:
    mov AH, 02h
    mov DH, 1
    mov DL, 12
    mov BH, 0h
    int 10h

Escribirtexto1:
    mov AH, 09h
    mov DX, msg1
    mov BH, 0h
    mov BL, 2h
    int 21h
    ret
Movtexto2:
    mov AH, 02h
    mov DH, 15
    mov DL, 25
    mov BH, 0h
    int 10h
    ret

Escribirtexto2:
    mov AH, 09h
    mov DX, msg2
    mov BH, 0h
    mov BL, 5h
    int 21h
    ret
Movtexto3:
    mov AH, 02h
    mov DH, 9
    mov DL, 9
    mov BH, 0h
    int 10h
    ret

Escribirtexto3:
    mov AH, 09h
    mov DX, msg3
    mov BH, 0h
    mov BL, 10h
    int 21h
    ret

Finalizar: 
    mov AH, 00h
    int 16h
    ret
