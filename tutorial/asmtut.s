.global main
	main:
	
		mov r0, #0
		mov r1, #10
		
		b loop
		
		loop: 				@ The loop label
			cmp r0,r1 		@ Compare r0 and r1.
			beq end			@ if r0 = r1, then branch out of the loop
			add r0, r0, #1		@ increment r0 by 1
			b loop			@repeat the loop again.
			
		end: 				@ end the program
		
			bx lr
			