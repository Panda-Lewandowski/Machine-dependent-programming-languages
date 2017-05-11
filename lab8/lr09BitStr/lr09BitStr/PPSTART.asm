.386
.model FLAT,C
PUBLIC START
extern COUNT:near, SetCler:near, A_B:near

.DATA
S 	DD 0,0,0,0
;S0  DD 00110111B
;S00 DD 10100100B
S1 	DD 00001111000011110000111100001111B,1010101B 
           ;0-38 - –¿«–ﬂƒ€ —“–Œ »
S2 	DD 00111100001111000011110000111100B,1000001B 
           ;0-38 - –¿«–ﬂƒ€ —“–Œ »
L DD 39;= ƒÀ»Õ¿ —“–Œ »
;L0 DD 32


.CODE
START:
   PUSH EBP
   MOV EBP, ESP

   PUSH OFFSET S1
   PUSH L
   CALL COUNT
   ADD ESP, 8
   
   PUSH OFFSET S1
   PUSH OFFSET S2
   PUSH L
   CALL A_B
   ADD ESP, 12

   PUSH OFFSET S2
   MOV ECX, 32
   PUSH ECX
   MOV ECX, 0
   PUSH ECX
   CALL SetCler
   ADD ESP, 12
   
   PUSH OFFSET S2
   MOV ECX, 1
   PUSH ECX
   MOV ECX, 1
   PUSH ECX
   CALL SetCler
   ADD ESP, 12

   POP EBP   

   RET 
END
