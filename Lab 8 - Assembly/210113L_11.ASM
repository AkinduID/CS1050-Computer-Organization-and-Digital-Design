

	CLO		; Close unwanted windows.
	MOV CL, 01	; Move 1 to CL where multiplication is stored
	MOV BL, 01	; Move 1 to BL where current multiplier stored
	MOV AL, 05	; Move 5 to AL which control the loop (Any value between 1 and 5 can be assigned)
Start:	
		
	MUL CL, BL	; value in CL is multiplied by value in BL and stored in CL
	INC BL		; Value in BL is incremented by 1
	DEC AL		; Value in AL is decremented by 1
	JNZ Start	; IF value in AL becomes 0 loop ends
	Call 20		;


	ORG	20	;
	MOV AL, F0	; F0(1111 0000) is moved to AL
	MOV BL, 0F	; 0F(0000 1111) is moved to BL
	AND AL, CL	; As AL mulptiplied by CL first digit of value in CL is filtered to AL
	AND BL, CL	; As AL mulptiplied by BL second digit of value in CL is filtered to BL
	SHR AL		; Bits in AL is shifted 4 times for the comparison process 
	SHR AL		;
	SHR AL		;
	SHR AL		;

	MOV [FF], CL	; Calculated value in CL is moved to ram address at FF
	MOV CL, 00	; CL is set to 0 to keep the count of how many numbers are printed to seven segment display
	MOV DL, 00	;
	compare_values:	;Below lines compare values in AL and jumps to relevent line to assign the corresponding 
	CMP AL, 00	;seven segment display activation values to DL
	JZ assign_value0;

	CMP AL, 01	;
	JZ assign_value1;

	CMP AL, 02	;
	JZ assign_value2;

	CMP AL, 03	;
	JZ assign_value3;

	CMP AL, 04	;
	JZ assign_value4;

	CMP AL, 05	;
	JZ assign_value5;

	CMP AL, 06	;
	JZ assign_value6;

	CMP AL, 07	;
	JZ assign_value7;

	CMP AL, 08	; No values get for comparison beyond 8 for this task
	JZ assign_value8;

	CMP AL, 09	;
	JZ assign_value9; 
	

	return_value:

	MOV	AL,00	;
	OUT	02	;

	MOV	AL,01	;
	OUT	02	;

	PUSH DL		; Copies value in DL to AL to output that value to output
	POP AL		;
	OUT	02	;

	PUSH BL		; Copies value in BL to AL to output that value
	POP AL		;
	

	MOV DL, 01	; 1 is moved to DL to indicate the right display of the seven segment display
	INC CL		; Value in CL is incremented by 1 to indicate the iteration of displaying to seven segment display
	CMP CL, 02	; If two values are displayed to the display jumps to end
	JZ	end	; 
	JMP compare_values	; Else proceed to display the second value


	assign_value0:		; Below lines assigns corresponding seven segment activation
	ADD DL, FA	;	  values to DL and jumps to return_value
	JMP return_value	;

	assign_value1:
	ADD DL, 0A	;
	JMP return_value	;

	assign_value2:
	ADD DL, B6	;
	JMP return_value	;

	assign_value3:
	ADD DL, 9E	;
	JMP return_value	;

	assign_value4:
	ADD DL, 4E	;
	JMP return_value	;
	
	assign_value5:
	ADD DL, DC	;
	JMP return_value	;

	assign_value6:
	ADD DL, FC	;
	JMP return_value	;

	assign_value7:
	ADD DL, 8A	;
	JMP return_value	;

	assign_value8:		;  No value get to return beyond 8 for this task
	ADD DL, FE	;
	JMP return_value	;

	assign_value9:
	ADD DL, DE	;
	JMP return_value	;


	end:
	MOV CL, [FF]	; Calculated value is retrieved to CL
	END		;
	
; ===== Program Ends ==========================================

	