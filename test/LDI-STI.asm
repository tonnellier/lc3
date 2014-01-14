	.ORIG x0000

	LD R1,val1		;R1 <- val1
	STI R1,val1		;MEM[MEM[val1]] <- R1
	.FILL 4
	.FILL 5
	ADD R1,R1,10
	.FILL 10
	LDI R1, val1		;R1 <- MEM[MEM[val1]]
	BR fin
	
val1:
	.FILL 3

fin:	NOP
	.END