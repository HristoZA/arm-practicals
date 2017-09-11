# ARM Assembly Practicals [WIP]

The code below is just for reference. THIS IS NOT A COMPLETE GUIDE. My knowledge of this subject is limited, so please don't take everything here as 100% factually correct. However, the code below does work and should help you solve the practicals. 

Feel free to correct me anywhere you see something incorrect. You can do so by making a pull request (preffered) or by emailing me at 3556336 at myuwc.ac.za (replace at with @)

I have left out some of practicals 1's questions because they're very bad questions to ask at our skill level, but the others are all there. 

Some useful links

* http://www.newthinktank.com/2016/04/assembly-language-tutorial/
* http://thinkingeek.com/arm-assembler-raspberry-pi/
* http://www.utdallas.edu/~pervin/RPiA/RPiA.pdf

# Shortcuts

* [Basic arithmetic](#basic-arithmetic)
* [Variables](#variables)
* [Printing to the screen](#printing-to-the-screen)
* [Branches and comparisons.](#)
* [Functions](#)
* [Arrays](#arrays)


# Basic Arithmetic

## Adding
	
	.global main
	main:

		mov r1, #10 		@ store the value 10 into register 1 (r1)
		mov r2, #15 		@ store the value 15 into register 2 (r2)

		add r0, r1, r2 		@ Store the value of r1 + r2 into r0. r0 ⟵ R1 + r2

		bx lr
		
## Subtracting

	.global main
	main:

		mov r1, #20 		@ store the value 20 into register 1 (r1)
		mov r2, #15 		@ store the value 15 into register 2 (r2)

		sub r0, r1, r2 		@ Store the value of r1 - r2 into r0. r0 ⟵ R1 - r2

		bx lr

# Variables
The way this works is you use memory to store variables and you load the values from memory into a register using the `ldr` operation. We declare these variables under the `.data` section and then our code must go under the `.text`section.

## Loading integers from memory.
	
	.data
	
	.balign 4 
	number_1: .word 10
	
	.balign 4 
	number_2: .word 15
		
	.text
	.global main
	main: 
		
		ldr r1, =number_1 	 @This gets the addrress of the variable from memory
		ldr r1, [r1]		 @This gets the actual value from memory so that we can use it to do arithmetic
		ldr r2, =number2
		ldr r2, [r2]
		
		add r0, r1 , r2 
		bx lr
		

# Printing to the screen

There are multiple ways to write to the screen in arm assembly. The first method is with system interupts, and the second is with the C function printf

## With System Interupts 

	.global main
	main:
		MOV R7, #4 		@ Syscall to output to screen
		MOV R0,  #1 		@ Monitor output stream
		MOV R2, #12 		@ String Length
		LDR R1, =message	@ Load register with address of string
		SWI 0

	end:
		MOV R7, #1 		@ Exit syscall
		SWI 0

	.data 				@ Signify that what follows is data
	message:
		.ascii "Hello World\n"
		
## With printf

	.data 

	.balign 4
	message: .asciz "Hello World\n"

	.text
	@ Hello World
	.global main
	.func main
	main:
		@basically this backs up the link register
		push {ip, lr}

		ldr r0, addr_message
		bl printf	

		@this restore the link register
		pop {ip, pc}
		bx lr

	addr_message: .word message

	.global printf
	
### Whats happening here

Basically, when the printf function is called, it prints to the screen whatever it has stored in r0. r0 is a parameter to the printf function. 

## Printf with parameters

    .data 

	.balign 4
	message: .asciz "This is how you print the number %d\n"
	
	.balign 4
	number_to_print: .word 10 @we want to print 10 to the screen
	
	.text
	@ Hello World
	.global main
	.func main
	main:
		@basically this backs up the link register
		push {ip, lr}

		ldr r0, addr_message		 @load the message into r0
		ldr r1, addr_number_to_print 	 @load the address of our number into register 1
		ldr r1, [r1] 			 @Load the actual value of our number into register 1
		bl printf	

		@this restore the link register
		pop {ip, pc}
		bx lr

	addr_message: .word message
	addr_number_to_print: .word number_to_print

	.global printf

### Whats happening here

Notice any similarities? In this case, the message required an int, since we added a `%d` in the message. We passed our number 10 as a paramater. 

# Branches and comparisons

Branching is basically a way of "jumping" over code. For example.

	.global main
	main:

		mov r1, #10
		mov r2, #20
		b end: 		@ Branch to label named end
		mov r1, #15 	@ This code will never be executed. 

		end:		@ The label 'end'
		
			add r0, r1, r2 @ r0 = r1 + r2. In this case r0 = 10 + 20
			bx lr
			
What happens here is that `b end` tells the program to branch over to end. So it will ignore the `mov r1, #15` command. Therefore r0 will have a value of 30. 

## Comparisons

Using the `cmp` operation allows you to compare the value of two registers and branch according to the result. 

	.global main
	main:
	
		mov r1, #10			@ r1 ⟵ 10
		mov r2, #20			@ r2 ⟵ 20
		
		cmp r1, r2			@Tells cpu to compare r1 and r2
		beq equal			@ If r1 = r2, branch to label equal
		ble less_than			@ if r1 < r2, branch to label less_than
		bgt greather_than		@ if r1 > r2, branch to label greater than
		
		equal: 
			mov r0, #1
			b end
		less_than:
			mov r0, #2
			b end
		bgt greater_than:
			mov r0, #3
			b end
			
		end: 		
			bx lr

# Arrays

	LDR R7, =array    @ R7 = array address
	MOV R8, #0        @; R8 = array index position to store R0 into
	STR R0, [R7, R8]  @ store R0 into array[R8]
