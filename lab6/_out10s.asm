PUBLIC	PR_Out10S
EXTRN	PR_NewLine:NEAR
EXTRN	PR_Out10:NEAR

Data	SEGMENT	PUBLIC
	XoutS	DW (?)
Data	ENDS




Code	SEGMENT	PUBLIC
	ASSUME CS:Code
;--------------------------------------------------------------------------------------
;Печатает переменную, переданную через стек, как десятичное число со знаком (15 как 15, -15 как -15)
;--------------------------------------------------------------------------------------
PR_Out10S	PROC	NEAR

		PUSH	BP								;передаем параметр
		MOV		BP,SP
		PUSH	AX

		MOV		AX,[BP+4]					;получаем в AX число, которое надо распечатать
		CMP		AX,0
		JGE		LO10S_SkipMinus		;если число отрицательное, то напишем - и передадим "перевернутое" значение в печать
		PUSH	AX
		MOV		AH,2h
		MOV		DL,'-'
		INT		21h
		POP		AX
		NEG		AX

LO10S_SkipMinus:
		PUSH	AX
		CALL	PR_Out10
		ADD		SP,2							;чистим стек

	POP		AX
	POP		BP
	RET
PR_Out10S	ENDP
;--------------------------------------------------------------------------------------
Code	ENDS

END
