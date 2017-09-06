.data

.balign 4
prompt_num: .asciz "Please enter a number: "

.balign 4
prompt_op: .asciz "\nPlease chose an operation add, subtract, factorial: "

.balign 4
output: .asciz "\n number rep: %d\n"

.balign 4
error_msg: .asciz "\nYour operator was invalid!\n"

.balign 4
pattern: .asciz "%d"

.balign 4
pattern_string: .asciz "%s"

.balign 4
num1: .word 0

.balign 4
num2: .word 0

.balign 4
op: .space 128

.balign 4
lr_bu: .word 0

.balign 4
str_add: .string "add"
.text

add_vals:
	push {ip, lr}
	
	add r0, r0, r1
	
	pop {ip, pc}
	bx lr
	
.global main
.func main
main: 
	push {ip, lr}
	
	@prompt for number
	ldr r0, adr_prompt_num
	bl printf
	
	@scan for first num and save to adr_num1
	ldr r0, adr_pattern
	ldr r1, adr_num1
	bl scanf
	
	@prompt for number
	ldr r0, adr_prompt_num
	bl printf

	@scan for second num and save to adr_num2
	ldr r0, adr_pattern
	ldr r1, adr_num2
	bl scanf
	
	@Move values into r2 and r3
	ldr r0, adr_num1
	ldr r0, [r0]
	ldr r1, adr_num2
	ldr r1, [r1]
	
	bl add_vals
	mov r1, r0
	ldr r0, adr_output
	bl printf
		
	end:
		@Restore Link Register
		pop {ip, pc}
		bx lr

adr_num1: .word num1
adr_num2: .word num2
adr_op: .word op
adr_str_add: .word str_add
adr_prompt_num: .word prompt_num
adr_prompt_op: .word prompt_op
adr_output: .word output
adr_error_msg: .word error_msg
adr_pattern: .word pattern
adr_pattern_string: .word pattern_string
adr_lr_bu: .word lr_bu

.global scanf
.global printf
