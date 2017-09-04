.global printf

ouput: .asciz "The 11th fibonacci number is %d\n"

.global main
main:

	mov r1, #1 /* a */
	mov r2, #1 /* b */
	mov r3, #2 /* i */

	loop:
		cmp r3, #11 
		bgt end
		add r4, r1, r2
		mov r1, r2
		mov r2, r4
		
		mov r4, #0
	
		add r3, r3, #1	/* Loop Counter ++ */
	b loop

end:
	mov r0, r1
	bl printf
	bx lr
