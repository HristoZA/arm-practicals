.global main
	main:

		mov r1, #20 		@ store the value 20 into register 1 (r1)
		mov r2, #15 		@ store the value 15 into register 2 (r2)

		sub r0, r1, r2 		@ Store the value of r1 - r2 into r0. r0 ⟵ R1 - r2

		bx lr
		