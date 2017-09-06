@Fixed what i could but not really sure what the program was meant to do.
@It compiles though :) 

.data

.balign 4
prompt_number1: .asciz "\nEnter Number 1\n"

.balign 4
prompt_number2: .asciz "\nEnter Number 2\n"

.balign 4
number_format: .asciz "%i"

.balign 4
number_response: .word 0

.text
.global main
main:

	push {ip, lr}

	ldr R0, =prompt_number1
	bl printf

	ldr R0, =number_format
	ldr R1, =number_response
	bl scanf

	ldr R0, =number_response
	ldr R0, [R0]
	mov r2, r1

	ldr R0, =prompt_number2
	bl printf

	ldr R0, =number_format
	ldr R1, =number_response
	bl scanf

	ldr R1, =number_response
	ldr R1, [R1]
	mov r3, r1

	CMP R2, R3
	BEQ if_equal

	mov r0,r3
	b end

	if_equal :
		mov r0, r2
		b end
	end:
		pop {ip,pc}
		BX lr

.global printf
.global scanf
