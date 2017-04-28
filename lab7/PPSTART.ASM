.386
.model FLAT,PASCAL
PUBLIC START
extern COUNT:near, A_B:near, SetCler:near;, A_U_B:near

.DATA
S 	DD 0,0,0,0
S1 	DD 00001111000011110000111100001111B,1010101B
           ;0-38 - РАЗРЯДЫ СТРОКИ
S2 	DD 00111100001111000011110000111100B,1000001B
           ;0-38 - РАЗРЯДЫ СТРОКИ
L DD 39;= ДЛИНА СТРОКИ


.CODE
START:
   PUSH OFFSET S1           ;заталкиваем адрес s1
   PUSH L                   ;заталкиваем длину строки
   CALL COUNT

   PUSH OFFSET S1           ;заталкиваем адрес S
   PUSH 1                   ;разряд S
   PUSH 1                   ;параметр P - здесь мы обнуляем 34й разряд
   CALL SetCler             ;S2,34

   PUSH OFFSET S2
   PUSH 34
   PUSH 0                    ;здесь мы задаем 34й разряд единицей
   CALL SetCler              ;S2,34

   PUSH OFFSET S1           ;адрес первой строки
   PUSH OFFSET S2           ;адрес второй строки
   PUSH L                   ;длина строки
   CALL A_B                 ; S1,S2,38


RET;
END
