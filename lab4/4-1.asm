PUBLIC B
EXTRN output_b:near

STK SEGMENT PARA STACK 'STACK'
	db 100 dup(0)
STK ENDS


DSEGA SEGMENT para public 'DATA'
	A db 'A'
DSEGA ENDS

DSEGB SEGMENT para public 'DATA'
	B db 'B'
DSEGB ENDS

CSEG SEGMENT para public 'CODE'
	assume CS:CSEG, DS:DSEGA


main:
	mov ax, DSEGA
	mov ds, ax
	mov dl, A
	
	mov ah, 2
	int 21h
	mov dl, 13
	int 21h
	mov dl, 10
	int 21h

	mov   AH,7                     
        INT   21h 
			                 
assume DS:DSEGB
	mov ax, DSEGB
	mov ds, ax

	call output_b

	mov ax, 4c00h
	int 21h


CSEG ENDS
END main