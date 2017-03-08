.data

S:			.asciiz  	"Hello World" ;S == Hello World
CONTROL:	.word		0x10000
DATA:		.word		0x10008

.text
	main:
		ld r20, CONTROL(r0)	
		ld r21, DATA(r0)
		
	len:
		lb r4, S(r3)	
		beqz r4, bringjback1
		daddi r3, r3, 1 ;j == r3
		j len
		
	bringjback1:
		daddi r3, r3, -1 ;for indexing at end of list cause its 0-4 not j[5]
		
	swaploop:
		slt r6, r3, r5 ;if r5 passes out r3 then r6 is set to 1
		bnez r6, donezo ;r5 == start and r3 == end
		
		lb r11, S(r5)
		lb r22, S(r3)
		
		sb r22, S(r5)
		sb r11, S(r3)
		
		daddi r5, r5, 1
		daddi r3, r3, -1
		
		j swaploop
		
	donezo:
		daddi r10, r0, S
		sd r10, 0(r21)
		daddi r10, r0, 4
		sd r10, 0(r20)
		halt
		
		
		
