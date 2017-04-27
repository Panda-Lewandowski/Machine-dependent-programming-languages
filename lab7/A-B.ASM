;Составить подпрограмму с именем A_B типа
;   Procedure (var A: LONGWORD; const B:LONGWORD; L:LONGWORD)
;выполняющую вычитание битовых строк A:=A \ B длины L.

.386
.model FLAT,PASCAL
PUBLIC A_B

.CODE
A_B PROC
A EQU DWORD PTR[EBP+16]           ;первая строка
B EQU DWORD PTR[EBP+12]           ;втроая строка
LAB EQU DWORD PTR[EBP+8]          ;длина строк

  PUSH EBP                        ;пишем старый адрес EBP
  MOV EBP,ESP                     ;пишем в EBP текущее значение ESP

  PUSH ESI                        ;сохраняем регистры
  PUSH EDI
  PUSH ECX
  PUSH EAX

  MOV ECX,LAB                     ;CX = l
  SHR ECX,5                       ;сдвигаем на 5 разрядов вправо
  MOV EDI,A
  MOV ESI,B

  INC ECX                         ;Инкрементируем ECX, чтобы цикл снизу выполнился 2 раза

M1:
  MOV EAX,[ESI]
  NOT EAX                         ;отрицаем содержимое EAX, это первая часть B
  AND [EDI],EAX                   ;объединяем
  ADD EDI,4                       ;сдвигаем указатели строк на 4
  ADD ESI,4
  LOOP M1                         ;возврат на исходную! (мы гоним этот цикл 2 раза,
                                  ;уменьшая ECX. После равенства его нулю мы идем дальше)

  POP EAX                         ;восстановление регистров
  POP ECX
  POP EDI
  POP ESI
  POP EBP
  RET 12
A_B ENDP
END
