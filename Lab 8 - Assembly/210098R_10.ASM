; ======================================================
; ===== 99sevseg.asm ===================================
; ===== Seven Segment Displays Port 02 =================
Start:
	MOV	AL,DE	; 1101 1110
	OUT	02	; Send the data in AL to Port 02
	
	MOV	AL,FF	; 1111 1111
	OUT	02	; Send the data in AL to Port 02
	END
; ======================================================
