.data
.balign 4
prompt_number1: .asciz "\nEnter Number 1\n"
prompt_number2: .asciz "\nEnter Number 2\n"
.balign 4
number_format: .asciz "%i"
.balign 4
number_response: .int 0
.text
.global main
.extern printf
.external scanf
main:
 push {ip, lr}
 ldr R0, =prompt_number1
 bl printf
 ldr R0, =number_format
 ldr R1, =number_response
 bl scanf
 ldr R0, =number_response
 ldr R0, [R0]
 add r2, r1
 ldr R0, =prompt_number2
 bl printf
 ldr R0, =number_format
 ldr R1, =number_response
 bl scanf
 ldr R1, =number_response
 ldr R1, [R1]
 mov r3, r1
 CMP R2, R3
 BEQ if_equal
 not_equal:
 mov r0,r3
b end
 if_equal :
 mov r0, r2
 push {ip,pc}
 b end
 end:
