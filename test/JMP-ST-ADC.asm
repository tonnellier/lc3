	;; Le programme	met R1 à 8,
	;; fait un JMP à l'adresse 8 (test JMP),
	;; remplace  MEM[6] et MEM[7] par x0008 (test ST),
	;; met R2 à 12 (loop)
	;; boucle afin de doubler R1	(test BRn et JMP)
	;; fini quand R1 est overflow (test ADC)
	
	.ORIG x0000

	AND R1,R1,0		;(l0) R1 <- 0
	ADD R1,R1,1		;R1 <- R1 + 1
	ADD R1,R1,R1		;R1 <- R1 + R1
	ADD R1,R1,R1		;R1 <- R1 + R1
	ADD R1,R1,R1		;(l4) R1 <- R1 + R1 (R1 = 8)
	
	JMP R1 			;On va à l'adresse R1
	
bidon1:	AND R1,R1,0		;(l6) R1 <- 0
bidon2:	AND R1,R1,0		;(l7) R1 <- 0

	ST R1,bidon1		;(l8) MEM[bidon1] <- R1
	ST R1,bidon2		;(l9) MEM[bidon2] <- R1

	AND R2,R2,0		;(l10) R2 <- 0
	ADD R2,R2,12		; R2 <- R2 + 12
	
loop:	AND R1,R1,R1		;(l12) pour tester R1 ensuite
	BRn fin			; Si R1 est negatif, on arrete
	ADD R1,R1,R1		;R1 <- R1 + R1 on double R1
	JMP R2			;(l15)On revient à R2 (normalement à loop)

fin:	NOP
	.END