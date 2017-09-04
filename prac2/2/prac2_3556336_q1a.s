.global main
main:

ldr r0, =fmtString
ldr r1, =var
bl scanf

ldr r0, =fmtStringOut
ldr r1, =var
ldr r1, [r1]
bl printf


.data

fmtString: 
	.asciz "Please enter your name: "

var: 
	.asciz "%d%"

fmtStringOut: 
	.asciz "%d"
