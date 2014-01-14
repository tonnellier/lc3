	;; Ce programme compte le nombre de 1 de value
;; retourne le resultat dans R0
	
	.ORIG x3000
	
mystere: LD R0, value
	JSR myst
	BR finprog

	
value:	.FILL 31

myst:	ADD R6,R6,-1
	STR R1,R6,0
	AND R1,R1,0
	AND R0,R0,R0
	BRz fini
	BRp bit0

bit1:	ADD R1,R1,1

bit0:	ADD R0,R0,R0
	BRp bit0
	BRn bit1

fini:	ADD R0,R1,0
	LDR R1,R6,0
	ADD R6,R6,1
	RET

finprog: NOP
	.END