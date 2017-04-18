DSEG	SEGMENT PARA PUBLIC 'DATA'
	F	DW ?
	N	DW 4
DSEG	ENDS

SSEG	SEGMENT PARA STACK 'STACK'
		DB	200h DUP(?)
SSEG	ENDS

CSEG	SEGMENT PARA 'CODE'
	ASSUME CS:CSEG, DS:DSEG, SS:SSEG
	Fact proc NEAR
		MOV		BP, SP								;сохраняем текущее положение указателя sp
		MOV		CX, [BP+4]						;в cx последний параметр / число
		DEC		CX										;уменьшаем на единицу
		JNZ		M1										;если не ноль, то прыг
		MOV		SI, [BP+2]						;
		MOV		WORD PTR [SI], 1			;в этот адрес аккумулируем значение
		RET													;возвращемся
M1:
		PUSH 	CX										;запоминаем CX
		PUSH	BX										;???
		CALL	Fact									;вызываем fact  / push адрес возврата
		ADD   SP, 4									;
		MOV		BP, SP								;достигается, когда CX станет нулем
		MOV		CX, [BP+4]						;берем косвенно значение из стека
		MOV		SI, [BP+2]						;берем адрес буфера
		MOV		AX, [SI]							;в АХ значение в буфере
		MUL		CX										;перемножаем
		MOV		[SI], AX							;в адрес результат
		RET													;идем к следующему числу / к верхнему коллу
	Fact ENDP


Start:
	MOV		AX, DSEG
	MOV		DS, AX

	PUSH 	N
	MOV	BX, OFFSET F
	PUSH	BX
	CALL	Fact
	ADD   SP, 4

	MOV		AH, 4Ch
	INT		21h
CSEG	ENDS
		END Start
