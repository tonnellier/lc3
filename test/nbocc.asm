; @param R0 adresse de la chaîne 
; @param R1 caractère
; @return R2 nombre d'occurrences du caractère
	.ORIG x3000
	LEA R0,chaine	; Chargement dans RO de l'adresse de la chaîne
	LD R1,caract	; Chargement dans R1 du code ASCII de 'l'
	AND R2,R2,0     ; Mise à 0 du compteur
	NOT R1,R1       ; Calcul de l'opposé de R1
	ADD R1,R1,1	; R1 = -R1
loop:	LDR R3,R0,0     ; Chargement dans R3 du caractère pointé par R0 (l5)
	BRz fini        ; Test de fin de chaîne
	ADD R3,R3,R1    ; Comparaison avec 'l'
	BRnp suite      ; Non égalité
	ADD R2,R2,1     ; Incrémentation du compteur
	
suite:	ADD R0,R0,1	; Incrémentation du pointeur (l10)
	BR loop
	
fini:	NOP
	
chaine:	.STRINGZ "Hello World\0"
caract:	.FILL 108
	
	.END