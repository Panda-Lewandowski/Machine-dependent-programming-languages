;—оставить подпрограмму с именем A_B типа
;   Procedure (var A: LONGWORD; const B:LONGWORD; L:LONGWORD)
;выполн€ющую вычитание битовых строк A:=A \ B длины L. 
.386
.model FLAT,C
PUBLIC A_B

.CODE
A_B PROC
  PUSH EBP
  MOV EBP,ESP
  
A EQU DWORD PTR[EBP+16]
B EQU DWORD PTR[EBP+12]
LXY EQU DWORD PTR[EBP+8]

  MOV EDX, 0
  MOV ECX, LXY
  MOV EAX, ECX
  MOV ECX, 32
  DIV ECX
  MOV ECX, EAX
  INC ECX

  PUSH B
  
  MOV EDX, B
  MOV EBX, [EDX]

  MOV EDX, A
  MOV EAX, [EDX]

  MOV ESI, 0

M_LOOP:
  NOT EBX
  AND EAX, EBX

  MOV EDX, A
  MOV [EDX][ESI], EAX

  ADD ESI, 4

  MOV EDX, B
  MOV EBX, [EDX][ESI]

  MOV EDX, A
  MOV EAX, [EDX][ESI]

  LOOP M_LOOP

  POP B
  POP EBP

  RET 
A_B ENDP
END
