;==INDEX -  210113L
;==LAST DIGITS - 13
;==1 - 0000101 0 - A
;==3 - 1001111 1 - 9F
CLO;
Start:

	MOV	AL,A	; 0000 101 0
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,9F	; 1001 111 1
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,0	; 0000 000 0
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,1	; 0000 000 1
	OUT	02	; Send the data in AL to Port 02

	JMP	Start
	
END
