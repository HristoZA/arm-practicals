.data

.balign 4
prompt_num: .asciz "Please enter a number: "

.balign 4
prompt_op: .asciz "\nPlease chose a number for an operation: add (1), subtract (2), factorial (3): "

.balign 4
output: .asciz "\nResult: %d\n"

.balign 4
error_msg: .asciz "\nYour operator was invalid!\n"

.balign 4
pattern: .asciz "%d"


.balign 4
num1: .word 0

.balign 4
num2: .word 0

.balign 4
op: .word 0

.text


	add_vals:
		push {ip, lr}
		
		add r0, r0, r1
		
		pop {ip, pc}
		bx lr
		
	sub_vals:
		push {ip, lr}
		
		sub r0, r0, r1
		
		pop {ip, pc}
		bx lr	
	
	fact_vals:
		push {ip, lr}
		
		mov r8, #1
		mov r9, r0
		mov r6, r0
		b loop
		
		loop:
			cmp r8, r1
			bge end_loop
			
			mul r6, r9, r0
			mov r9, r6
			add r8, r8, #1
			b loop
		
		end_loop:
		mov r0, r6
		
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
	
	@prompt for operation
	ldr r0, adr_prompt_op
	bl printf
	
	@scan for op and save to adr_op
	ldr r0, adr_pattern
	ldr r1, adr_op
	bl scanf	
	
		
	@Move values into r2 and r3
	ldr r0, adr_num1
	ldr r0, [r0]
	ldr r1, adr_num2
	ldr r1, [r1]
	
	ldr r3, adr_op
	ldr r3, [r3]
	cmp r3, #1
	beq add
	cmp r3, #2
	beq sub
	cmp r3, #3
	beq fact
	b error
	
	add:		
		bl add_vals
		mov r1, r0
		ldr r0, adr_output
		bl printf
		b end
		
	sub:
		bl sub_vals
		mov r1, r0
		ldr r0, adr_output
		bl printf
		b end
		
	fact:		
		bl fact_vals
		mov r1, r0
		ldr r0, adr_output
		bl printf
		b end
			
		
	error:
		ldr r0, adr_error_msg
		bl printf
		b end	
	
		
	end:
		@Restore Link Register
		pop {ip, pc}
		bx lr

adr_num1: .word num1
adr_num2: .word num2
adr_op: .word op
adr_prompt_num: .word prompt_num
adr_prompt_op: .word prompt_op
adr_output: .word output
adr_error_msg: .word error_msg
adr_pattern: .word pattern

.global scanf
.global printf
