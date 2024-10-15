; ===== WORK OUT 2 PLUS 2 ======================================
	CLO		; Close unwanted windows.
	MOV DL,13	; Copy a 6 into the DL register.
	MOV AL,7	; Copy a 7 into the AL register.
	DIV DL,AL	; Divide DL by AL. Answer goes into DL.
	END;
; ===== Program Ends ===========================================

	