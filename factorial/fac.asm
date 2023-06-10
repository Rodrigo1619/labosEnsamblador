org   100h

section .text

;acumulador para la multiplicacion y caso base
MOV AX, 1d

;Valor del cual se quiere calcular el factorial
MOV CX, 5d

main:
    CALL subrutine

    INT 20h

subrutine:
    ;verificamos el caso base: o! => 1
    CMP CX, 0
    ;si es cero termina la ejecucion del programa
    JE basecase
    
    ;calcular el factorial del numero si es distinto de cero
    CALL factorial
    RET


basecase:
    MOV byte[200h], 'f'
    MOV byte[201h], 'i'
    MOV byte[202h], 'n'
    ;retorna a main
    RET

factorial:
    ;Calcula el factorial entre el registro AX y CX
    MUL CX
    loop factorial
    RET
    