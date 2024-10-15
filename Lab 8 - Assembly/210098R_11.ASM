; ===== multiply 1 to 5 =============================

CLO		; Close unwanted windows.
Start:
	MOV CL,1 	; Copy a 1 into the CL register.
	MOV BL,1	; Copy a 1 into the BL register.
here:
	INC BL		; Increment Bl by 1.
	PUSH CL		; Saving CLs value because its going to end up overflown.
	MUL CL,BL	; Multiply CL with BL and save to CL.
	JNO here	; Jump while no overflow
	POP CL		; After loop restoring the multiplication result.

;====== Below code will implement the displaying the result 78. ===

	MOV AL,8A	; 1000 1010
	OUT 02		; Send the data in AL to Port 02
	
	MOV AL,FF	; 1111 1111
	OUT 02	 	; Send the data in AL to Port 02

	END
;