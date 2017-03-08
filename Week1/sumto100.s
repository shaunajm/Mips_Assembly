.data 
A:		.word 0
I:		.word 1
C:		.word 101

.text
		main:
			ld r1,A(r0)
			ld r2,I(r0)
			ld r3, C(r0)
		
		
		loop:
			beq r2, r3, done   ;whiles(i<C)
			dadd r1, r1, r2    ;inc s by i
			daddi r2, r2, 1    ;inc i by 1
			j loop			   ;jump to loop again
			
			
		done:
			halt				;when i is == c so ans is in r1
			
		
