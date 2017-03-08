.data 
A:		.word 1
B:		.word 0
C:		.word 0
I:		.word 0
MAX:	.word 21

.text
		main:
			ld r1,A(r0) ;r1 = 1
			ld r2,B(r0)	;
			ld r3, C(r0)
			ld r4, I(r0)
			ld r5, MAX(r0)
			
		loop:
			
			beq r4, r5, done   ;whiles(i<21)

			
			dadd r3, r2, r1 ;r1 = r1 + r2
			dadd r2, r0, r1 ; mov r2, r1
			dsub r1, r1, r1
			dadd r1,r0, r3 ; mov r1, r3
			daddi r4, r4, 1 ;inc i
			
			j loop
			
		done:
