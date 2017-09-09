# ARM Assembly Practicals

This will serve as a walkthrough to the assembly practicals for CSC212. My knowledge of this subject is limited, and these code snippets are just for reference. Feel free to correct me anywhere you see something incorrect. You can do so by makinga pull request (preffered) or by emailing me at [3556336@myuwc.ac.za](mailto:3556336@myuwc.ac.za)

I have left out some of practicals 1's questions because they're very bad questions to ask at our skill level, but the others are all there. 

Some useful links

* http://www.newthinktank.com/2016/04/assembly-language-tutorial/
* http://thinkingeek.com/arm-assembler-raspberry-pi/

## Printing to the screen

There are multiple ways to write to the screen in arm assembly. The first method is with system interupts, and the second is with the C function printf

### With System Interupts 

    @ Hello World
	.global main
	main:
		MOV R7, #4 @ Syscall to output to screen
		MOV R0,  #1 @ Monitor output stream
		MOV R2, #12 @ String Length
		LDR R1, =message @ Load register with address of string
		SWI 0
		
	end:
		MOV R7, #1 @ Exit syscall
		SWI 0
		
	.data @ Signify that what follows is data
	message:
		.ascii "Hello World\n"
		
### With printf
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
	
#### Whats happening here

Basically, when the printf function is called, it prints to the screen whatever it has stored in r0. r0 is a parameter to the printf function. 

### Printf with parameters

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

#### Whats happening here

Notice any similarities? In this case, the message required an int, since we added a '%d' in the message. We passed our number 10 as a paramater. 
