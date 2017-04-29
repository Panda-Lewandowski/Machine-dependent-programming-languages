;Составить подпрограмму с именем SetCler типа
;   Procedure (var A: LONGWORD; N:LONGWORD; P:LONGWORD)
;выполняющую установку разряда N битовой строки S
;в ноль, если P=0, в единицу,если P не равен 0.

.386
.model FLAT,PASCAL
PUBLIC SetCler


.CODE
SetCler PROC
A EQU DWORD PTR[EBP+16]         ;наша строка
N EQU DWORD PTR[EBP+12]         ;номер разряда
P EQU DWORD PTR[EBP+8]          ;параметр

  PUSH EBP                      ;пишем старый адрес EBP
  MOV EBP,ESP                   ;пишем в EBP текущее значение ESP

  PUSH EBX                      ;сохраняем регистры
  PUSH ESI

  MOV ESI,N                     ;в EDI грузим длину строки
  MOV EBX,A
  CMP ESI, 32
  JNA M0
  SUB ESI, 32
  MOV EBX, ESI
  MOV ESI, 32
  SUB ESI, EBX
  
M0:
  MOV EAX, 32
  ;MOV ECX,N                      ;номер разряда
  ;MOV ESI,N
  SUB EAX, ESI
  MOV ESI, EAX
  CMP P,0                       ;сравниваем режим с нулем
  JE M1                         ;если равно, то прыг на м1
  ;OR [EBX+EDI*4],EAX            проставляем единичку в разряд
  BTS [EBX], ESI
  JMP M2
M1:
  ;NOT EAX                       инвертируем EAX
  ;AND [EBX+EDI*4],EAX           операция И над разрядами
  BTR [EBX], ESI
M2:
  POP ESI
  POP EBX
  POP EBP                       ;и указателя EBP
  RET 12
SetCler ENDP
END
