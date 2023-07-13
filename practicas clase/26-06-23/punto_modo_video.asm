org   100h
section   .text

main:
  CALL iniciarmodovideo
  CALL punto
  INT 20H


iniciarmodovideo:
  MOV AH, 00H
  MOV AL, 13H
  INT 10h
  RET

punto:
  MOV AH, 0CH
  MOV AL, 0FH
  MOV CX, 50h
  MOV DX, 70h
  INT 10h
  RET