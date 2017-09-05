.text
.global printf
.global main
main:

	mov r7, #3
	mov r0, #0
	mov r2, #10
	ldr r1, =message
	SWI 0	


write:
	ldr r0, =message
	bl printf
	
end:
	mov r7, #1
	SWI 0
	
.data
message:
	.asciz " \n"
	