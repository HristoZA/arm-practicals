.text                   @This is actually not really necessary

.global main            @you declare public your main function like we used to do in Java

main:
	mov r7, #4         @System call to write on screen
	mov r0, #1         @OuputStream on the screen
	mov r2, #len       @Number of character to write
	ldr r1, =message   @Load register with address of string
	swi 0              @End program and return to terminal

	mov r7, #1         @Exit System Call

@input syscall:
	mov r7, #3         @System call to read from keyboard
	mov r0, #0         @Input Stream keyboard
	mov r2, #len       @Number of char to write
	ldr r1, =message1  @Load register with address of string
	swi 0              @End program and return to terminal

end:
	mov r7, #1         @Exit System Call
	swi 0              @End program and return to terminal

.data
message:
	.ascii "Enter your name and surname: "
len = .-message            @automatically calculate the length of the string that u inputing

message1:
	.ascii " "
  
