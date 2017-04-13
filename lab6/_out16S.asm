PUBLIC	PR_Out16S
EXTRN	PR_NewLine:NEAR
EXTRN	PR_Out16:NEAR






Code	SEGMENT	PUBLIC
	ASSUME CS:Code
;--------------------------------------------------------------------------------------
;Печатает переменную, переданную через стек, как шестнадцатиричное число со знаком (15 как F, -15 как -F)
;--------------------------------------------------------------------------------------
PR_Out16S	PROC	NEAR
	PUSH	BP									;передаем параметр
	MOV		BP,SP
	PUSH	AX

	MOV		AX,[BP+4]						;получаем в AX число, которое надо распечатать
	CMP		AX,0
	JGE		LO16S_SkipMinus			;если число отрицательное, то напишем - и передадим "перевернутое" значение в печать

	PUSH	AX

	MOV		AH,2h
	MOV		DL,'-'
	INT		21h
	POP		AX
	NEG		AX

LO16S_SkipMinus:
	PUSH	AX
	CALL	PR_Out16
	ADD		SP,2								;чистим стек

	POP		AX
	POP		BP
	RET
PR_Out16S	ENDP
;--------------------------------------------------------------------------------------
Code	ENDS

END
