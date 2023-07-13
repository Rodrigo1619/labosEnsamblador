org   100h
section   .text

main:
  CALL iniciarmodotexto
  CALL moverCursor
  CALL esperarTecla
  MOV [200h], AL
  INT 20H


iniciarmodotexto:
  MOV AH, 00H
  MOV AL, 03H
  INT 10h
  RET

moverCursor:
  MOV AH, 02H
  MOV DH, 10d
  MOV DL, 20d
  MOV BH, 0H
  INT 10H
  RET


esperarTecla:
  MOV AH, 02h 
  INT 16h
  CMP AL, 01
  JNE esperarTecla
  RET