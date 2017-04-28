;—оставить подпрограмму с именем A_B типа
;   Procedure (var A: LONGWORD; const B:LONGWORD; L:LONGWORD)
;выполн€ющую вычитание битовых строк A:=A \ B длины L.

.386
.model FLAT,PASCAL
PUBLIC A_B

.CODE
A_B PROC
A EQU DWORD PTR[EBP+16]           ;перва€ строка
B EQU DWORD PTR[EBP+12]           ;втроа€ строка
LAB EQU DWORD PTR[EBP+8]          ;длина строк

  PUSH EBP                        ;пишем старый адрес EBP
  MOV EBP,ESP                     ;пишем в EBP текущее значение ESP

  PUSH ESI                        ;сохран€ем регистры
  PUSH EDI

  MOV ECX,LAB                     ;CX = l
  SHR ECX,5                       ;сдвигаем на 5 разр€дов вправо
  MOV EDI,A
  MOV ESI,B

  INC ECX                         ;»нкрементируем ECX, чтобы цикл снизу выполнилс€ 2 раза

M1:
  MOV EAX,[ESI]
  NOT EAX                         ;отрицаем содержимое EAX, это перва€ часть B
  AND [EDI],EAX                   ;объедин€ем
  ADD EDI,4                       ;сдвигаем указатели строк на 4
  ADD ESI,4
  LOOP M1                         ;возврат на исходную! (мы гоним этот цикл 2 раза,
                                  ;уменьша€ ECX. ѕосле равенства его нулю мы идем дальше)


  POP EDI
  POP ESI
  POP EBP
  RET 12
A_B ENDP
END
