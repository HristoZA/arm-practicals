/* main-function.s */
.data
 
.text
.globl main
 
.balign 4
 
main:
  push {r4, lr}                /* we are going to do a
                                  call so keep lr, and also r4
                                  for a 8-byte aligned stack */
  bl myfun@PLT                 /* call function in library */
 
  ldr r0, offset_of_GOT        /* r0 â† offset-to-GOT
                                  (respect to got_address)*/
  got_address: add r0, pc, r0  /* r0 â† pc + r0 
                                  this is
                                    r0 â† &GOT */
  ldr r1, myvar_in_GOT         /* r1 â† offset-of-myvar-inside-GOT */
  ldr r0, [r0, r1]             /* r0 â† *(r0 + r1)
                                  this is
                                    r0 â† *(&GOT + offset-of-myvar-inside-GOT) */
  ldr r1, [r0]                 /* r0 â† *r1 */
  add r1, r1, #1               /* r1 â† r1 + 1 */
  str r1, [r0]                 /* *r0 â† r1 */
 
  bl myfun@PLT                 /* call function in library a second time */
 
  pop {r4, lr}                 /* restore registers */
  mov r0, #0                   /* end as usual */
  bx lr
 
offset_of_GOT: .word _GLOBAL_OFFSET_TABLE_  - (got_address + 8)
myvar_in_GOT : .word myvar(GOT)
