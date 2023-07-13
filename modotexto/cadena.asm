org 100h

section .text

call    IniciarModoTexto
call    MoverCursor
call    EscribirCadena
call    EsperarTecla

int 20h

;FUNCIONES

IniciarModoTexto:       ;int 10h / 00h
    mov     AH, 0h
    mov     AL, 03h
    int     10h
    ret


MoverCursor:            ;int 10h / 02h
    mov     AH, 02h 
    mov     DH, 10 ;fila
    mov     DL, 20  ;columna
    mov     BH, 0h ;pagina
    int     10h
    ret

EscribirCaracter:       ;int 10h / 09h
    mov     AH, 09h 
    mov     BL, 14h ;atributo del caracter (color de fondo en 0, color de primer plano en rojo)
    mov     CX, 1h 
    int     10h
    ret

EscribirCadena:         ;int 10h / 0Eh
    pusha                ; Guardar los registros en la pila
    mov     SI, mensaje  ; Cargar la dirección de la cadena en SI
    mov     AH, 0Eh      ; Función 0Eh (escribir carácter) si se quiere decimal solo se escribe 14 SIN H
    
loop:
    lodsb               ; Cargar el siguiente byte de la cadena en AL y avanzar SI esto es LOAD STRING BYTE
    test    AL, AL      ; Verificar si hemos alcanzado el final de la cadena (carácter nulo)
    jz      fin         ; Si es el final, salta a fin
    int     10h         ; Llamar a la interrupción 10h para escribir el carácter
    jmp     loop        ; Volver a loop para escribir el siguiente carácter de la cadena
    
fin:
    popa                 ; Restaurar los registros desde la pila
    ret

EsperarTecla:           ;int 16h / 00h
    mov     AH, 00h 
    int     16h
    ret

section .data
    mensaje db 'Hola, mundo!', 0

;LO QUE SIGNIFICA TEST Y PORQUE SE UTILIZO
;test: Esta instrucción compara el valor del registro AL consigo mismo (AL, AL) 
;realizando una operación de bits AND. La finalidad de esta comparación es verificar 
;si el byte cargado en AL es nulo (0). Si el resultado de la operación es cero, 
;significa que AL es cero, lo cual indica que hemos alcanzado el final de la cadena.
