org 100h

section .text

call ModoTexto
call MoverCursor1
call EscribirCadena1
call MoverCursor2
call EscribirCadena2
call MoverCursor3
call EscribirCadena3
call Finalizar

int 20h

section .data
mensaje1 db 'ola camaron sin cola', 0
mensaje2 db 'eeee mesi', 0
mensaje3 db 'el que lo vea esto ess gei', 0

;definición de funciones

ModoTexto:
    mov AH, 0h
    mov AL, 03h
    int 10h
    ret

MoverCursor1:
    mov AH, 02h
    mov DH, 1
    mov DL, 12
    mov BH, 0h
    int 10h
    ret

EscribirCadena1:
    pusha
    mov SI, mensaje1
    mov AH, 0Eh

loop1:
    lodsb
    test AL, AL
    jz fin1
    int 10h
    jmp loop1

fin1:
    popa
    ret

MoverCursor2:
    mov AH, 02h
    mov DH, 15
    mov DL, 25
    mov BH, 0h
    int 10h
    ret

EscribirCadena2:
    pusha
    mov SI, mensaje2
    mov AH, 0Eh

loop2:
    lodsb
    test AL, AL
    jz fin2
    int 10h
    jmp loop2

fin2:
    popa
    ret

MoverCursor3:
    mov AH, 02h
    mov DH, 9
    mov DL, 9
    mov BH, 0h
    int 10h
    ret

EscribirCadena3:
    pusha
    mov SI, mensaje3
    mov AH, 0Eh

loop3:
    lodsb
    test AL, AL
    jz fin3
    int 10h
    jmp loop3

fin3:
    popa
    ret

Finalizar: 
    mov AH, 00h
    int 16h
    ret
