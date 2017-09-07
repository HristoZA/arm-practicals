# ARM Assembly Practicals

This will serve as a walkthrough to the assembly practicals for CSC212.

I have left out some of practicals 1's questions because they're very bad questions to ask at our skill level, but the others are all do-able. 

## Printing to the screen

There are multiple ways to write to the screen in arm assembly. The first method is with system interupts, and the second is with the C function printf

### With System Interupts 

    @ Hello World
	.global _start
	_start:
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
