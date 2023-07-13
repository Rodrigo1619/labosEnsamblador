org   100h
section   .text

main:
  CALL iniciarmodotexto
  CALL moverCursor
  CALL esperarTecla

  MOV [200H], AL
  MOV [210H], AH

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
  MOV   AH, 00h 
  INT   16h
  RET
