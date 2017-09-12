.data

.align 4
arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.align 4
message_1: .asciz "Before exchange: \n"

.align 4
message_2: .asciz "After exchange: \n"

.align 4
integer_printf: .asciz "%d "
.align 4
newline_printf: .asciz "\n"

.text

print_arr:

	@ r0 is the adress of the array
	@ r1 is the number if items in the array
	
	push {r4, r5, r6, lr}
	
	mov r4, r0 		@ r4 stores address of array
	mov r5, r1		@ r5 stores size of array
	mov r6, #0		@ r6 is our current item
	
	print_loop:
	
		cmp r6, r5 
		beq end
		ldr r0, adr_integer_printf
		ldr r1, [r4, +r6, LSL #2] @ r4 (base adress + r6 *4)
		bl printf
		
		add r6, r6, #1
		b print_loop
	
	
	end:
	
	ldr r0, adr_newline_printf
	bl printf
	
	pop {r4, r5, r6, lr}
	bx lr
	
adr_integer_printf: .word integer_printf
adr_newline_printf: .word newline_printf
	
	
sort_arr:

	@ r0 is the adress of the array
	@ r1 is the number if items in the array
	
	push {r4, r5, r6, r7, r8, lr}
	
	mov r4, r0 		@ r4 stores address of array
	mov r5, r1		@ r5 stores size of array
	mov r6, #0		@ r6 is our current item
	mov r7, #1		@ r9 is the value to store
	sub r5, r5, #1
	
	sort_loop:
		cmp r6, r5
		bge sort_end		
		add r8, r6, #1
		str r8, [r4, +r7, LSL #2]
		add r8, r7, #1
		str r8, [r4, +r6, LSL #2]

		
		add r6, r6, #2
		add r7, r7, #2
		b sort_loop
		
	sort_end:
		pop {r4, r5, r6, r7, r8, lr}
		bx lr
	
.global main
main:

	push {r4, lr}
	
	ldr r0, adr_message_1
	bl printf
	
	ldr r0, adr_arr
	mov r1, #10	
	
	bl print_arr
	
	ldr r0, adr_message_2
	bl printf
	
	ldr r0, adr_arr
	mov r1, #10		
	
	bl sort_arr

	ldr r0, adr_arr
	mov r1, #10		
	
	bl print_arr
		
	mov r0, #0
	pop {r4, lr}
	bx lr
	
adr_message_1: .word message_1
adr_message_2: .word message_2
adr_arr: .word arr
	