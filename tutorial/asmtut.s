.data

.align 4
arr: .skip 40


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
		beq end_print
		ldr r0, adr_integer_printf
		ldr r1, [r4, +r6, LSL #2] @ r4 (base adress + r6 *4)
		bl printf
		
		add r6, r6, #1
		b print_loop
	
	
	end_print:
	
		ldr r0, adr_newline_printf
		bl printf
		
		pop {r4, r5, r6, lr}
		bx lr
	
adr_integer_printf: .word integer_printf
adr_newline_printf: .word newline_printf

.global main
main:
	push {r4, lr}
	ldr r1, adr_arr
	mov r2, #0 
	
	loop:
		cmp r2, #10
		beq end
		add r3, r2, #1
		str r3, [r1, +r2, LSL #2]
		add r2, r2, #1
		
		b loop
	end:
	
		ldr r0, adr_arr
		mov r1, #10
		bl print_arr
		
		pop {r4, lr}
		bx lr
	
	
adr_arr: .word arr
	