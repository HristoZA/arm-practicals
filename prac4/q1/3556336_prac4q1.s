.data

.align 4
arr: .skip 10

.text
.global main
main:

	ldr r1, adr_arr
	mov r2, #0 
	
	loop:
		cmp r2, #10
		beq end
		add r3, r2, #1
		str r3, [r1, +r2, LSL #2]
		add r2, r2, #1
		
		b loop
	end:
		mov r0, #0
		bx lr
	
	
adr_arr: .word arr
	