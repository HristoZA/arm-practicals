.data

.align 4
arr: .skip 40

.align 4
integer_printf: .asciz "%d "

.align 4
newline_printf: .asciz "\n"

.text

print_arr:

	@r0 is the address of the array
	@r1 is the number of items in the array
	
	push {r4, r5, r6, lr}

	mov r4, r0	@ r4 is the base address of array
	mov r5, r1	@ r5 is the size of the array
	mov r6, #0	@ r6 is our current index position
	
	
	
	print_loop:
		cmp r6, r5 
		beq end_print
		ldr r0, adr_integer_printf
		ldr r1, [r4, +r6, LSL #2]
		bl printf
		
		add r6, r6, #1
		b print_loop
		
	end_print:
		
		ldr r0, adr_newline_printf
		bl printf
		
		pop {r4, r5, r6, lr}
		bx lr
	
fibonnaci:
	@ r0 is the base address of the array
	@ r1 is the size of the array
	
	push {r4, r5, r6, r7, lr}
	
	mov r4, r0	@ base address
	mov r5, r1	@ size of array
	mov r6, #0	@ position in array
	
	mov r0, #1
	str r0, [r4, +r6, LSL #2]
	add r6, r6, #1
	str r0, [r4, +r6, LSL #2]
	add r6, r6, #1
	
	fib_loop:
	
		cmp r6, r5 
		beq end_fib
		
		sub r7, r6, #1
		ldr r0, [r4, +r7, LSL #2]
		
		sub r7, r7, #1
		ldr r1, [r4, +r7, LSL #2]
		
		add r0, r0, r1
		
		str r0, [r4, +r6, LSL#2]
		
		add r6, r6, #1
		
		b fib_loop				
		
	end_fib:
	
		pop {r4, r5, r6, r7, lr}
		bx lr


.global main
main:
	push {ip, lr}
	ldr r1, adr_arr
	mov r2, #0
	
	/* loop:
		cmp r2, #10
		beq end
		add r3, r2, #1
		str r3, [r1, +r2, LSL #2]
		add r2, r2, #1
		
		b loop
	end: */
	
		ldr r0, adr_arr
		mov r1, #10
		bl fibonnaci
		
		ldr r0, adr_arr
		mov r1, #10
		bl print_arr
		
		mov r0, #0
		
		
		pop {ip, pc}
		bx lr
	
adr_arr: .word arr

.global printf

adr_integer_printf: .word integer_printf
adr_newline_printf: .word newline_printf
