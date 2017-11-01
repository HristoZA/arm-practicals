.data

errmsg: .asciz "create failed"
errmsgend:
newfile: .asciz "/home/pi/newfile"
arr: .word 5, 1, 3, 6, 7, 8, 4, 9, 210

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

 ldr r8, =arr
 mov r9, #9
 mov r10, #0

loop:

 /* WRITE TO FILE */
 cmp r10, r9
 beq end_loop

 mov r0, r4 @ file_descriptor
 ldr r1, [r8, +r10, LSL #2]
 mov r2, #1 @ length from read
 mov r7, #4 @ write
 svc 0

 add r10, r10, #1
 b loop

end_loop:

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


