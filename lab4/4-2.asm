PUBLIC output_b
EXTRN B:byte

CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG
output:
	mov ah, 2
	int 21h
	mov dl, 13
	int 21h
	mov dl, 10
	int 21h
	ret

output_b:
	
	mov dl, B
	call output
	

	mov ax, 4c00h
	int 21h
	
CSEG ENDS
END output_b
