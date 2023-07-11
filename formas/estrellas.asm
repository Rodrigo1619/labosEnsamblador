org 100h ; Código COM
section .text

    mov ax, 13h    ; Modo gráfico 13h
    int 10h        ; Llama a la rutina de la BIOS

    mov cx, 160    ; Coordenada x del centro del círculo
    mov dx, 100    ; Coordenada y del centro del círculo
    mov bx, 50     ; Radio del círculo

    mov si, 0      ; Ángulo inicial

DRAW_CIRCLE:
    cmp si, 256    ; Ángulo máximo
    jge DRAW_DONE

    ; Calcular las coordenadas del punto en base a coordenadas polares
    mov ax, bx     ; Radio
    mul si         ; Ángulo
    mov di, 256    ; Divisor
    div di         ; Dividir para obtener las coordenadas en base a una circunferencia completa
    add ax, cx     ; Sumar la coordenada x del centro del círculo
    mov cx, ax     ; Guardar la nueva coordenada x
    mov ax, bx     ; Radio
    mul si         ; Ángulo
    mov di, 256    ; Divisor
    div di         ; Dividir para obtener las coordenadas en base a una circunferencia completa
    add ax, dx     ; Sumar la coordenada y del centro del círculo
    mov dx, ax     ; Guardar la nueva coordenada y

    call DRAW_POINT

    inc si         ; Incrementar el ángulo

    jmp DRAW_CIRCLE

DRAW_DONE:
    mov ah, 0      ; Leer una tecla para salir
    int 16h

    mov ax, 3h     ; Modo de texto 3h
    int 10h

    mov ah, 4Ch    ; Salir del programa
    int 21h

DRAW_POINT:
    mov ah, 0Ch    ; Función de la interrupción 10h para dibujar un píxel
    mov al, 1      ; Color blanco
    int 10h
    ret

section .bss
