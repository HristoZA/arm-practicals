.data

.balign 4
prompt_num1: .asciz "Please enter number 1: "

.balign 4
prompt_num2: .asciz "\nPlease enter number 2: "

.balign 4
output: .asciz "Number 1 is %d\n"

.balign 4
scan_pattern: .asciz "%d"

.balign 4
num_reader: .word 0

.balign 4
return: .word 0

.text 
.global main
main:
	ldr r1, adr_return
	str lr, [r1]
	
	ldr r0, adr_prompt_num1
	bl printf
	
	ldr r0, adr_scan_pattern
	ldr r1, adr_num_reader
	bl scanf
	
	ldr r0, =adr_output
	ldr r1, adr_num_reader
	ldr r1, [r1]	
	bl printf

	ldr r0, adr_num_reader
	ldr r0, [r0]
		
	ldr lr, adr_return
	ldr lr, [lr]
	bx lr
	
adr_prompt_num1: .word prompt_num1
adr_prompt_num2: .word prompt_num2
adr_output: .word output
adr_scan_pattern: .word scan_pattern
adr_num_reader: .word num_reader
adr_return: .word return

.global printf
.global scanf
