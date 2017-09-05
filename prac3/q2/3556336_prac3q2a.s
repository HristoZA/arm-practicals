/* -- printf01.s */
.data

.balign 4
message1: .asciz "Hey, type a number: "
 
.balign 4
message2: .asciz "I read the number %s\n"
 
.balign 4
scan_pattern : .asciz " "m
 
.balign 4
number_read: .word 0
 
.balign 4
return: .word 0
 
.text
 
.global main
main:

    ldr r1, adr_return        /* r1 ← &adr_return */
    str lr, [r1]                     /* *r1 ← lr */
 
    ldr r0, adr_message1      /* r0 ← &message1 */
    bl printf                        /* call to printf */
 
    ldr r0, adr_scan_pattern  /* r0 ← &scan_pattern */
    ldr r1, adr_number_read   /* r1 ← &number_read */
    bl scanf                         /* call to scanf */
 
    ldr r0, adr_message2      /* r0 ← &message2 */
    ldr r1, adr_number_read   /* r1 ← &number_read */
    ldr r1, [r1]                     /* r1 ← *r1 */
    bl printf                        /* call to printf */
 
    ldr r2, adr_number_read   /* r0 ← &number_read */
    ldr r2, [r2]                     /* r0 ← *r0 */


 
    ldr lr, adr_return        /* lr ← &adr_return */
    ldr lr, [lr]                     /* lr ← *lr */
    bx lr                            /* return from main using lr */

adr_message1 : .word message1
adr_message2 : .word message2
adr_scan_pattern : .word scan_pattern
adr_number_read : .word number_read
adr_return : .word return
 
/* External */
.global printf
.global scanf
