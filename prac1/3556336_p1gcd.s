.extern printf

.data

.balign 4
num1: .word 15

.balign 4
num2: .word 5

.balign 4

gcd_result: .asciz "The GCD of 15 and 5 is %d\n"

.text

.global main
main:

	push {ip, lr}

	ldr r1, adr_num1
	ldr r1, [r1]
	
	ldr r2, adr_num2
	ldr r2, [r2]
	
	
	/* Uses a basic GCD algorithm */
	gcd:
		cmp r2, #0
		beq end
		bne subtract
		subtract:
			cmp r1, r2
			subgt r1, r1, r2
			sublt r2, r2, r1
	
		bne gcd
	end:		
		ldr r0, =gcd_result		
		bl printf

	pop {ip, pc}
		
adr_num1  : .word num1
adr_num2 : .word num2
