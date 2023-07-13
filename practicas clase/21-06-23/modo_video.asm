org   100h
section   .text

main:
  CALL iniciarmodovideo
  INT 20H


iniciarmodovideo:
  MOV AH, 00H
  MOV AL, 12H
  INT 10h
  RET