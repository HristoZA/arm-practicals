.data

.align 4
arr: .word 1, 2, 3, 5, 9, 10, 99, 1000, 95, 12

.align 4
message_1: .asciz "Before sort: \n"

.align 4
message_2: .asciz "After sort: \n"

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
		beq end_print_loop
		ldr r0, adr_integer_printf
		ldr r1, [r4, +r6, LSL #2] @ r4 (base adress + r6 *4)
		bl printf
		
		add r6, r6, #1
		b print_loop
	
	
	end_print_loop:
	
	ldr r0, adr_newline_printf
	bl printf
	
	pop {r4, r5, r6, lr}
	bx lr
	

bubble_sort:

	@r0 is the base address 
	@r1 is the size of array n
	push {r3, r4, r5, r6, r7, lr}
	
	mov r3, #0			@i
	sub r1, r1, #1			@n-1
	mov r5, #9
	
	i_loop:
		mov r4, #1		@j
		cmp r3, r1
		beq bubble_end
		
		j_loop:
			cmp r4, r5
			beq j_end_loop
			
			ldr r6, [r0, +r4, LSL #2]
			add r4, r4, #1
			ldr r7, [r0, +r4, LSL #2]
			cmp r6, r7
			bgt swap					
			
			b j_loop
			
			swap:
				str r6, [r0, +r4, LSL #2]
				sub r4, r4, #1
				str r7, [r0, +r4, LSL #2]
				add r4, r4, #1
				
				b j_loop
			
				
			j_end_loop:
				add r3, r3, #1
				b i_loop
		
	bubble_end:
	
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	
.global main
main:
	push {ip, lr}
	
	ldr r0, adr_message_1		@before sort message
	bl printf
	
	ldr r0, adr_arr			@before sort array print
	mov r1, #10
	bl print_arr
	
	
	ldr r0, adr_arr	
	mov r1, #9
	bl bubble_sort
	
	ldr r0, adr_message_2		@after sort message
	bl printf		
	
	ldr r0, adr_arr			@after sort array print
	mov r1, #10
	bl print_arr
	
	pop {ip, pc}
	
adr_arr: .word arr
adr_integer_printf: .word integer_printf
adr_newline_printf: .word newline_printf
adr_message_1: .word message_1
adr_message_2: .word message_2
