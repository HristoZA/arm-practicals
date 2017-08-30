.extern printf

.data

output: 
	.asciz "1.5 + 2.5 is %f\n"
num1: 
	.float 1.5
num2: 
	.float 2.5

.text

.global main
main:

	ldr r1, adr_num1
	vldr s0, [r1]
	
	ldr r2, adr_num2
	vldr r1, [r2]
	vadd.f32 s2, s0, s1
	
	vcvt.f64.f32 d1, s2	
	
	ldr r0, =output

	vmov r2, r3, d1

	bl printf

	bx lr

adr_num1: .word num1
adr_num2: .word num2
