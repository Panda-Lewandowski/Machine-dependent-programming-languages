;Составить подпрограмму с именем Count типа
;      function (const S: LONGWORD; L:LONGWORD)
;возвращающую число единиц битовой строки S длины L.
.386
.model FLAT,C
PUBLIC COUNT

.CODE
COUNT:
  PUSH EBP
  MOV EBP,ESP

A EQU DWORD PTR[EBP+12]
L EQU DWORD PTR[EBP+8]

  INC L
  MOV ECX, L
  MOV EBX, A
  MOV EDX, [EBX]
  MOV EAX, 0

M1:
    BT EDX, ECX
    JC LoP
    INC EAX
LoP:
    LOOP M1
        
  POP EBP

  RET
END
