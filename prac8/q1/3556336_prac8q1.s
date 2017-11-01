.data

errmsg: .asciz "create failed"
errmsgend:
newfile: .asciz "/home/pi/newfile"
prompt: .asciz "Input a string: \n"
promptend:
buffer: .byte 100

.text
.global main    
main:

 push {r4, lr}

 @ CREATE FILE 
 ldr r0, =newfile
 mov r1, #0x42 @ create R/W
 mov r2, #384 @ = 600 octal (me)
 mov r7, #5 @ open (create)
 svc 0

 cmp r0, #-1 @ file descriptor
 beq err

 mov r4, r0 @ save file_descriptor

 /* READ */
 mov r0, #0 @ stdin (keyboard)
 ldr r1, =buffer @ address of buffer
 mov r2, #26 @ maximum length of input
 mov r7, #3 @ read
 svc 0
 mov r5, r0 @ save number of characters

 /* WRITE TO FILE */
 mov r0, r4 @ file_descriptor
 ldr r1, =buffer @ address of buffer
 mov r2, r5 @ length from read
 mov r7, #4 @ write
 svc 0

 /* CLOSE FILE */
 mov r7, #6 @ close
 svc 0
 mov r0, r4 @ return file_descriptor as error code

exit: 
 pop {r4, lr}
 mov r7, #1 @ exit
 svc 0

err: 

 mov r4, r0
 mov r0, #1
 ldr r1, =errmsg
 mov r2, #(errmsg - errmsgend)
 mov r7, #4
 svc 0

 mov r0, r4
 b exit


