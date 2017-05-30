.386
.model FLAT,C
PUBLIC DlinaStroki

.CODE
DlinaStroki:
  PUSH EBP
  MOV EBP, ESP

  PUSH EDI
  PUSH ESI
  PUSH EBX
  
  MOV EDI, [EBP+8]
  
  MOV ECX, -1

  MOV AL, 0
  CLD
  REPNZ SCASB
  ADD ECX, 1

  NEG ECX

  MOV EAX, ECX

  POP EBX
  POP ESI
  POP EDI

  MOV ESP, EBP
  POP EBP
  
  RET
END