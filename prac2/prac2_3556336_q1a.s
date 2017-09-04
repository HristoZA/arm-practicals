.data

.balign 4
prompt:
	.asciz "Please enter your name: "
.balign 4
input_format:
	.asciz "%d"
.balign 4
output_format:
	.asciz "The name is %d\n"
.balign 4
name: 
	.word 0
.balign 4
return:
	.word 0

.text

.global main
main:	
	
	ldr r1, adr_return
	str lr, [r1]

	ldr r0, adr_prompt
	bl printf

	ldr r0, =adr_input_format
	ldr r1, =adr_name
	bl scanf

	ldr r0, adr_output_format
	ldr r1, adr_name
	ldr r1, [r1]
	bl printf

	ldr r0, adr_name
	ldr r0, [r0]

	ldr lr, adr_return
	ldr lr, [lr]
	bx lr
	
adr_prompt : .word prompt	
adr_return : .word return
adr_output_format : .word output_format
adr_input_format : .word input_format
adr_name : .word name

.global printf
.global scanf
