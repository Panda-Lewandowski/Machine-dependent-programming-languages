;Составить подпрограмму с именем SetCler типа
;   Procedure (var A: LONGWORD; N:LONGWORD; P:LONGWORD)
;выполняющую установку разряда N битовой строки S
;в ноль, если P=0, в единицу,если P не равен 0.

.386
.model FLAT,PASCAL
PUBLIC SetCler


.CODE
SetCler PROC
A EQU DWORD PTR[EBP+20]         ;наша строка
N EQU DWORD PTR[EBP+16]         ;номер разряда
L EQU DWORD PTR[EBP+12]
P EQU DWORD PTR[EBP+8]          ;параметр

  PUSH EBP                      ;пишем старый адрес EBP
  MOV EBP,ESP                   ;пишем в EBP текущее значение ESP

  PUSH EBX                      ;сохраняем регистры
  PUSH ESI

  MOV ECX, L
  MOV ESI,N                     ;в ESI грузим номер разряда
  MOV EBX,A                     ;адрес строки
  CMP ESI, 32
  JNA M
  MOV ECX, L
  MOV ESI, N
  SUB ECX, ESI
  MOV EDX, 0
  MOV EAX, ECX
  MOV ESI, 32
  DIV ESI

  MOV EDX, 0
  MOV ESI, 4
  MUL ESI
  MOV ESI, EAX

  MOV EBX, A[ESI]

M:
  MOV EAX, 32                   ;вычисляем сдвиг по старшим битам
  SUB EAX, ESI                  ;в основной части
  MOV ESI, EAX
M0:
  CMP P,0                       ;сравниваем режим с нулем
  JE M1                         ;если равно, то прыг на м1
  BTS [EBX], ESI
  JMP M2
M1:
  BTR [EBX], ESI
M2:
  POP ESI                       ;восстанавливаем регистры
  POP EBX
  POP EBP
  RET 12
SetCler ENDP
END
