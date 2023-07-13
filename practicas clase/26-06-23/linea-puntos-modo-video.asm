org   100h

section .text
MOV CX, 639d

MOV AH, 00H 
MOV AL, 12H
INT 10h

cycle:
  MOV AH, 0CH 
  MOV AL, 0FH 
  MOV DX, 0EFH 
  INT 10H 
  INC SI
  LOOP cycle

S1:
  MOV AH, 00H
  INT 16H 
  CMP AL, 41H
  JNE S1 
  INT 20H

