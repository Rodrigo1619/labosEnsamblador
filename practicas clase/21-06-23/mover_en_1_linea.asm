org   100h
section   .text

main:
  CALL iniciarmodotexto
  CALL moverCursor
  CALL EsperarTecla
  INT 20H


iniciarmodotexto:
  MOV AH, 00H
  MOV AL, 03H
  INT 10h
  RET

moverCursor:
  MOV AH, 06H
  MOV AL, 01H
  MOV BH, 30H
  MOV CX, 00H
  MOV DX, 184FH
  INT 10H
  RET

EsperarTecla:
  mov     AH, 00h 
  int     16h

  ret