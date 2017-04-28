;—оставить подпрограмму с именем Count типа
;      function (const S: LONGWORD; L:LONGWORD)
;возвращающую число единиц битовой строки S длины L.

.386
.model FLAT,PASCAL
PUBLIC COUNT

.CODE
COUNT:
A EQU DWORD PTR[EBP+12]       ;наша строка
L EQU DWORD PTR[EBP+8]        ;длина строки
  PUSH EBP                    ;пишем старый адрес EBP
  MOV EBP,ESP                 ;пишем в EBP текущее значение ESP

  PUSH EBX                    ;сохран€ем регистры

  MOV EAX,0                   ;результат
  MOV EBX,A                   ;пишем адрес строки
  MOV ECX,L                   ;длина строки
  MOV ESI,0 

M0:
  MOV EDX,1
M:
  ;TEST [EBX],EDX              ;сравнение EDX и строки
  BT [EBX], ESI
  JA M2                       ;если 0
  INC EAX                     ;EAX += 1
M2:
  DEC ECX                     ;уменьшаем значение длины
  JZ M4                       ;до тех пор пока длина != 0, проводим подсчет
  ;SHL EDX,1                  ;побитовый сдвиг влево, выдвига€ в CX бит
  INC ESI
  JZ M3                       ;если CF = 1, прыг на ћ3
  JMP M                       ;иначе прыг на ћ
M3:
  ADD EBX,4                   ;по сути это дл€ второго слова уже повтор
  JMP M0
M4:
  
  POP EBX
  POP EBP                     ;и указател€ EBP
  RET 8
END


;использование команды bt