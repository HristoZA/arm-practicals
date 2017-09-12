.data

.align 4
arr: .skip 40		@ Create space for an array of size 10

.text
.global main
main:

	ldr r1, adr_arr				@ load array into r1
	mov r2, #0 				@ set r2 to 0 (as a counter)
	
	loop:
		cmp r2, #10			@ Compare r2 to size of array
		beq end				@ if r2 = size of array, branch to end
		add r3, r2, #1			@ The value to be written at the position r2 in array
		str r3, [r1, +r2, LSL #2]	@ Store r3 in the base address (r1) + r2 *4
		add r2, r2, #1			@ increase count of r2 by 1
		
		b loop				@ Begin loop again
	end:
		mov r0, #0			@ Set exit status to 0
		bx lr				@ Exit the program
	
	
adr_arr: .word arr
	
