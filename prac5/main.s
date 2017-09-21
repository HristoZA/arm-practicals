/* main.s */
.data
.globl myvar
 
.text
.globl main
 
.balign 4
main:
    ldr r0, addr_myvar  /* r0 â† &myvar */
    ldr r1, [r0]        /* r1 â† *r0 */
    add r1, r1, #1      /* r1 â† r1 + 1 */
    str r1, [r0]        /* *r0 â† r1 */
 
    mov r0, #0          /* end as usual */
    bx lr
 
addr_myvar: .word myvar
