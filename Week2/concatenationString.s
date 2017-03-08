.data 

	A:		.asciiz		"Hello "
	B:		.asciiz		"World"
	C:		.asciiz 	"XXXXXXXXXXX"
	
	CONTROL:	.word		0x10000
	DATA:		.word		0x10008
	
.text
	main:
		ld r20, CONTROL(r0)	
		ld r21, DATA(r0)
		
	lenA:
		lb r4, A(r5)	
		beqz r4, lenB
		daddi r5, r5, 1 ;lenA == r5
		j lenA
		
	lenB:
		lb r4, B(r7)	
		beqz r4, setup
		daddi r7, r7, 1 ;j == r7
		j lenB
		
	setup:
		daddi r5, r5, -1
		daddi r7, r7, -1
		
	swaploopA:
		slt r24, r5, r8
		bnez r24, swaploopB
		
		lb r9, A(r8)
		lb r15, C(r8)
		
		sb r15, A(r8)
		sb r9, C(r8)
		
		daddi r8, r8, 1
		j swaploopA
	
	swaploopB:
		slt r25, r7, r11
		bnez r25, donezo
		
		lb r12, B(r11)
		lb r16, C(r8)
		
		sb r16, B(r11)
		sb r12, C(r8)
		
		daddi r8, r8, 1
		daddi r11, r11, 1
		j swaploopB
		
	donezo:
		daddi r10, r0, C
		sd r10, 0(r21)
		daddi r10, r0, 4
		sd r10, 0(r20)
		halt
		
		
		
		
		
		
		
	
		
