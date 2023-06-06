org 100h

section .text

mov AL, 00d
mov BL, 00d
call iterar

int 20h

iterar: 
    mov AL, 15d
    mov BL, 03d
    add AL, AH
    RET