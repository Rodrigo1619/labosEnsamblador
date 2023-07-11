; Este programa dibuja un cuadrado de 100x100 píxeles en la esquina superior izquierda de la pantalla
; Se asume que el modo gráfico es 13h (320x200, 256 colores)
; Se usa el color blanco (15) para el cuadrado

org 100h ; código COM

mov ax, 13h ; modo gráfico 13h
int 10h ; cambiar a modo gráfico

mov cx, 0 ; coordenada x inicial
mov dx, 0 ; coordenada y inicial
mov al, 15 ; color blanco
mov ah, 0ch ; función para poner un píxel

; dibujar el lado superior del cuadrado
mov bx, 100 ; contador de píxeles
lado_superior:
int 10h ; poner un píxel en (cx, dx) con el color al
inc cx ; incrementar la coordenada x
dec bx ; decrementar el contador
jnz lado_superior ; repetir hasta que el contador sea cero

; dibujar el lado derecho del cuadrado
mov bx, 100 ; contador de píxeles
lado_derecho:
int 10h ; poner un píxel en (cx, dx) con el color al
inc dx ; incrementar la coordenada y
dec bx ; decrementar el contador
jnz lado_derecho ; repetir hasta que el contador sea cero

; dibujar el lado inferior del cuadrado
mov bx, 100 ; contador de píxeles
lado_inferior:
int 10h ; poner un píxel en (cx, dx) con el color al
dec cx ; decrementar la coordenada x
dec bx ; decrementar el contador
jnz lado_inferior ; repetir hasta que el contador sea cero

; dibujar el lado izquierdo del cuadrado
mov bx, 100 ; contador de píxeles
lado_izquierdo:
int 10h ; poner un píxel en (cx, dx) con el color al
dec dx ; decrementar la coordenada y
dec bx ; decrementar el contador
jnz lado_izquierdo ; repetir hasta que el contador sea cero

; esperar una tecla para salir
mov ah, 00h ; función para leer una tecla
int 16h ; leer una tecla

mov ax, 03h ; modo texto 03h
int 10h ; cambiar a modo texto

ret ; terminar el programa
