.data

.balign 4
output: .asciz "The 10th fibonacci number is: %d\n"

.balign 4
lr_bu: .word 0

.text
.global main
main:

	ldr r1, adr_lr_bu
	str lr, [r1]

	mov r1, #1 /* a */
	mov r2, #1 /* b */
	mov r3, #2 /* i */

	loop:
		cmp r3, #10
		bgt end
		add r4, r1, r2
		mov r1, r2
		mov r2, r4
		
		mov r4, #0
	
		add r3, r3, #1	/* Loop Counter ++ */
	b loop

end:
	ldr r0, adr_output
  	bl printf

	ldr lr, adr_lr_bu
	ldr lr, [lr]
	bx lr
	
	

adr_output: .word output
adr_lr_bu: .word lr_bu

.global printf
