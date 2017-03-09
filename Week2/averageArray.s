.data
	lenA: 		.word 20      ; There are 20 elements in array "a". LENGTH
	A: 			.word 23      ; a[0]
				.word 12      ; a[1]
				.word 19      ; a[2]
				.word 9       ; .
				.word 98      ; .
				.word 4       ; .
				.word 7
				.word 9
				.word 30405
				.word 21
				.word 16288
				.word 26483
				.word 9982
				.word 261
				.word 5025
				.word 18825
				.word 30405
				.word 9575
				.word 9575
				.word 25247   ; a[19]
   
	CONTROL:	.word		0x10000
	DATA:		.word		0x10008
	
.text
	;;ld r2,a0(r1) 						; r2 = a[i]; (where r1 == i * 8)
	
	main:
		ld r20, CONTROL(r0)	
		ld r21, DATA(r0)
		
		daddi r3, r0, 0 ;r3 == total
		daddi r4, r0, 0 ;r4 == pointer
		
	loopdaloop:
		ld r5, lenA(r0) ;r5 == lenA
		beq r5, r4, donezo
		
		daddi r8, r0, 8 ;set r8 to 8
		dmul r7, r4, r8
		ld r6, A(r7) ;load A[pointer]
		dadd r3, r3, r6 
		daddi r4, r4, 1
		j loopdaloop
		
	donezo:
		mtc1 r3,f3
		mtc1 r5, f5
		div.d f11, f3, f5
		
		add.d f10, f0, f11
		s.d f10, 0(r21)
		daddi r10, r0, 3
		sd r10, 0(r20)
		halt
