;CODIGO QUE DIBUJA UN TRIANGULO VERDE
section .data
    FIL  dw 0     ; Variable FIL para la posición vertical inicial
    COL dw 0      ; Variable COL para la posición horizontal inicial
    ANCH dw 0     ; Variable ANCH para el ancho de la base del triángulo
    ANCHF dw 0    ; Variable ANCHF para la altura máxima del triángulo
  
section .text
    global _start

_start:
    mov ax, 13h ; modo gráfico 13h
    int 10h

    mov word [FIL], 10    ; Establecer el valor inicial de FIL
    mov word [COL], 220   ; Establecer el valor inicial de COL
    mov word [ANCH], 100  ; Establecer el valor inicial de ANCH
    mov word [ANCHF], 60  ; Establecer el valor inicial de ANCHF

    mov cx, word [COL]    ; Mover el valor de COL a CX
    mov bx, word [ANCH]   ; Mover el valor de ANCH a BX
    add bx, cx            ; Sumar CX a BX
    mov word [ANCH], bx   ; Mover el resultado de vuelta a ANCH
    mov dx, word [FIL]    ; Mover el valor de FIL a DX

DN:
    call COLOR2           ; Llamar a la subrutina COLOR2 para dibujar un píxel
    inc cx                ; Incrementar CX
    cmp cx, word [ANCH]   ; Comparar CX con ANCH
    je N                  ; Saltar a N si son iguales
    jmp DN                ; Volver al inicio del bucle DN

N:
    inc dx                ; Incrementar DX
    cmp dx, word [ANCHF]  ; Comparar DX con ANCHF
    je FIN                ; Saltar a FIN si son iguales
    add word [COL], 1     ; Incrementar COL
    mov cx, word [COL]    ; Mover el valor de COL a CX
    sub word [ANCH], 1    ; Restar 1 a ANCH
    jmp DN                ; Volver al inicio del bucle DN

COLOR2:
    mov ah, 0Ch           ; Función de la interrupción 10h para dibujar un píxel
    mov al, 01h           ; Color verde
    int 10h
    ret

FIN:
    mov ah, 07h           ; Función de la interrupción 21h para esperar una tecla
    int 21h


