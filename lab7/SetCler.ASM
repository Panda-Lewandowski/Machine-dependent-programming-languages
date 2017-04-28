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
  PUSH EDI

  MOV EDI,N                     ;в EDI грузим длину строки
  SHR EDI,5                     ;сдвигаем на 5 разрядов вправо
  MOV ECX,N                     ;в ECX кладем "старое" значение EDI
  AND ECX,11111B                ;деление по модулю 32
  MOV EAX,1
  SHL EAX,CL                    ;сдвигаем на то, что осталось в младшей части ECX
  MOV EBX,A                     ;собственно адрес самой строки
  CMP P,0                       ;сравниваем режим с нулем
  JE M1                         ;если равно, то прыг на м1
  OR [EBX+EDI*4],EAX            ;проставляем единичку в разряд
  JMP M2
M1:
  NOT EAX                       ;инвертируем EAX
  AND [EBX+EDI*4],EAX           ;операция И над разрядами
M2:
  POP EDI
  POP EBX
  POP EBP                       ;и указателя EBP
  RET 12
SetCler ENDP
END
