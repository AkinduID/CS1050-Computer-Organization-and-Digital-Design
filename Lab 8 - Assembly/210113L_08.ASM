; ===== CONTROL THE TRAFFIC LIGHTS =============================

	CLO		; Close unwanted windows.
Start:
			; Turn off all the traffic lights.
	MOV AL,0	; Copy 00000000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).

	MOV AL,84	; Copy 100 001 00 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV CL, 10      ; Set CL to 10 (number of iterations)
	Loop1:
    		DEC CL     ; Decrement CL by 1
    		JNZ Loop1  ; Jump to Loop label if CL is not zero
	
	MOV AL,48	; Copy 010 010 00 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV CL, 1       ; Set CL to 1 (number of iterations)
	Loop2:
    		DEC CL     ; Decrement CL by 1
    		JNZ Loop2  ; Jump to Loop label if CL is not zero

	MOV AL,30	; Copy 001 100 00 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV CL, 5   	; Set CL to 5(number of iterations)
	Loop3:
    		DEC CL     ; Decrement CL by 1
    		JNZ Loop3  ; Jump to Loop label if CL is not zero
	
	JMP Start	; Jump back to the start.
	END		; Program ends.
