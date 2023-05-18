org 100h
section .text
mov byte [0200h], 0
mov byte [0201h], 0
mov byte [0202h], 0
mov byte [0203h], 6
mov byte [0204h], 7
mov byte [0205h], 9
mov byte [0206h], 2
mov byte [0207h], 0

mov AL, byte[0205h]
mov BL, byte[0206h]

mov byte[0210h], AL
add byte[0210h], BL