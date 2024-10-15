; ===== multiply 1 to 5 =============================
Start:
	MOV AL,1 	; Copy a 1 into the AL register.
	MOV BL,1	; Copy a 1 into the BL register.
	MOV CL,AL	; Copy the original value of AL to CL
here:
	INC BL		; Increment Bl by 1.
	MOV DL,AL	; Keeping the value safetly because AL gonna get overflowed.
	MUL AL,BL	; Multiply AL with BL and save to AL.
	JNO here	; Jump while no overflow
	
	END
;