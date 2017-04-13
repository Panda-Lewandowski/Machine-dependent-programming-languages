PUBLIC	PR_InputInt
EXTRN	sEnter:BYTE

Data	SEGMENT	PUBLIC
	sSucceed	DB	13,10,'<entered>',13,10,'$'
Data	ENDS

Code	SEGMENT	PUBLIC
	ASSUME CS:Code


;--------------------------------------------------------------------------------------
;Ввод целого числа со знаком и без; возвращает введенное число через AX
;--------------------------------------------------------------------------------------
PR_InputInt	PROC	NEAR
		PUSH	BX						;в ВХ будем хранить промежуточный результат ввода
		PUSH	DX						;DX для печати
		PUSH	SI						;наличие знака
		MOV		AX,0
		MOV		BX,0

		MOV		AH,9
		LEA		DX,sEnter			;воспользуемся пока что ДХ чтобы вывести приглашение к вводу
		INT		21h
		MOV		DX,0   				;очистим ДХ

LII_Loop:
		MOV		AH,1
		INT		21h						;получаем в АЛ символ из стдин

		CMP		AL,13					;если в АЛ - ентер, то закругляемся
		JE		LII_Success   ;jump если равно ^

		CMP		AL,2Dh 				; если АЛ - минус
		JNE		LII_NotMinus  ;jump если не минус
		MOV		SI,1					;запомним что число отрицательное
		JMP		LII_Loop  		;следующий символ

LII_NotMinus:

		;#define юзверь не дурак и вводит только цифры
		PUSH	AX						;сохраним символ из АЛ в стек
		MOV		AX,BX         ;в АХ то, что уже конвертировали или ноль
		MOV		BX,10					;потому что ассемблер не умеет MUL 10
		MUL		BX						;умножаем уже введенную часть на 10  AX *= 10
		POP		BX						;получим обратно символ
		SUB		BL,'0'				;преобразуем символ в цифру("а" - "0")
		MOV		BH,0					;обнуляем ВН на всякий 
		ADD		BX,AX					;добавим цифру к введенной части.
		JMP		LII_Loop

LII_Success:
		MOV	AX,BX						;в АХ результат
		CMP	SI,1						;если нужно, то умножим на -1
		JNE	LII_End					;иначе эпилог функции
		NEG	AX							;АХ *= -1

LII_End:
		PUSH	AX						;сохраняем АХ, чтобы вывести сообщение
		LEA		DX,sSucceed
		MOV		AH,9
		INT		21h
		POP		AX						;восстанавливаем регистры
		POP		SI
		POP		DX
		POP		BX
		RET
PR_InputInt	ENDP
;--------------------------------------------------------------------------------------

Code	ENDS

END
