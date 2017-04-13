;С0Т Ц вывод пунктов меню с номерами 0..8

PUBLIC	PR_PrintMenu
EXTRN	PR_NewLine:NEAR

Data	SEGMENT	PUBLIC
	sMenu	DB	10,13,'   MENU', '$'
	sM0		DB	'0. Pechat menu', '$'
	sM1		DB	'1. Vvod celogo', '$'
	sM2		DB	'2. Pechat dvoichnogo bez znaka', '$'
	sM3		DB	'3. Pechat dvoichnogo so znakom', '$'
	sM4		DB	'4. Pechat desyatichnogo bez znaka', '$'
	sM5		DB	'5. Pechat desyatichnogo so znakom', '$'
	sM6		DB	'6. Pechat shestnadcati- bez znaka', '$'
	sM7		DB	'7. Pechat shestnadcati- so znakom','$'
	sM8		DB	'8. Vyhod', '$'
Data	ENDS





Code	SEGMENT	PUBLIC
	ASSUME CS:Code, DS:Data
;--------------------------------------------------------------------------------------
;печатает меню программы
;--------------------------------------------------------------------------------------
PR_PrintMenu	PROC	NEAR
	PUSH	AX
	PUSH	DX
	
	MOV		AH,9	;печать строк
	
	LEA		DX,sMenu
	INT		21h
	CALL	PR_NewLine
	LEA		DX,sM0
	INT		21h
	CALL	PR_NewLine
	LEA		DX,sM1
	INT		21h
	CALL	PR_NewLine
	LEA		DX,sM2
	INT		21h
	CALL	PR_NewLine
	LEA		DX,sM3
	INT		21h
	CALL	PR_NewLine
	LEA		DX,sM4
	INT		21h
	CALL	PR_NewLine
	LEA		DX,sM5
	INT		21h
	CALL	PR_NewLine
	LEA		DX,sM6
	INT		21h
	CALL	PR_NewLine
	LEA		DX,sM7
	INT		21h
	CALL	PR_NewLine
	LEA		DX,sM8
	INT		21h
	
	POP		DX
	POP		AX	
	RET
PR_PrintMenu	ENDP
;--------------------------------------------------------------------------------------
Code	ENDS

END