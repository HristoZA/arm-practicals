
.global printf
.global scanf

.data

.balign 4
prompt: .asciz "Please enter a temparature: \n"

.balign 4
input_format: .asciz "%d"

.balign 4
temp: .word 0

.balign 4
bad_input: .asciz "ERROR: Your input should be an integer between 10 and 100"

.balign 4
output_pants: .asciz "Wear Pants"

.balign 4
output_shorts : .asciz "Wear shorts"

.text
.global main
main:
	push {ip, lr}
	ldr r0, adr_prompt
	bl printf

	ldr r0, adr_input_format
	ldr r1, adr_temp
	bl scanf

	ldr r1, [r1]
	cmp r1, #10
	blt end

	end:
		ldr r0, adr_bad_input
		bl printf
		
		mov r0, #0
		

	pop {ip, pc}
adr_prompt : .word prompt
adr_input_format : .word input_format
adr_temp : .word temp
adr_bad_input : .word bad_input

