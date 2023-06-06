; Brandon Rodrigo Molina Arias 00067920

org 100h
section .text

;Haciendo el direccionamiento por registro
mov AL, 35d
mov BL, AL
;Haciendo el direccionamiento inmediato
mov BH, 25d

;para hacer la suma
add BL, BH

;moviendo a la direccion de memoria 200h
mov byte [0200h], BL

;haciendo el direccionamiento indirecto
mov AL, byte [0200h]

; cargando en el registro BL el dato 5d 
mov BL, 5d

;haciendo la multiplicacion
; multiplicar el valor en BL por 2
; quitamos lo que teniamos en AH para poder ver que la multiplicacion de BL se realiza de forma correcta y guarda A
mov AH, 0
mov AL, BL
mov BL, 2
imul BL

; almacenar el resultado en la dirección de memoria 210h
mov byte [0210h], AL