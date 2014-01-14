	.ORIG x0000

	AND R1,R1,0		;(l0) R1 <- 0
	ADD R1,R1,1		;R1 <- R1 + 1
	ADD R1,R1,R1		;R1 <- R1 + R1
	ADD R1,R1,R1		;R1 <- R1 + R1
	ADD R1,R1,R1		;(l4) R1 <- R1 + R1 (R1 = 8)
	
	JSRR R1
	
	BR autre1
	AND R1,R1,0 		;R1 <- 0	
	RET

autre1:	JSR autre2		;(l9)
	BR fin
	
autre2:	RET

fin:	NOP
	.END