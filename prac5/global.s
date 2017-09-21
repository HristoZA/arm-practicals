/* global.s */
.data

.balign 4
.globl myvar
myvar : .word 63     /* initial value of 63 */
.size myvar, .-myvar
