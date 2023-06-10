; programa que convierte de Fahrenheit a Celsius
org 100h
section .text

; ESTE ES EL NUMERO QUE QUIERO CONVERTIR
MOV AX, 0
MOV AX, 75 ; Valor de temperatura en grados Fahrenheit
CALL conversion
MOV WORD[200h], AX ;movemos la respuesta a la memoria 200
INT 20h

;aquí empezamos con la conversión
conversion:
    sub AX, 32    ; Restar 32 a los grados Fahrenheit
    imul AX, 5    ; Multiplicar por 5

    ; Dividir por 9
    MOV BX, 9     ; Cargar el divisor en el registro BX
    cwd           ; Extender el signo de AX a DX:AX
    idiv BX       ; Realizar la división
    RET
