.data

.balign 4
prompt: .asciz "Please enter the temprature: "

.balign 4
error_message: .asciz "Bad input. Please ensure your input is between 10 and 100 degrees\n"

.balign 4
msg_shorts: .asciz "Wear Shorts\n"

.balign 4
msg_pants: .asciz "Wear pants and get some excerise.\n"

.balign 4
temp: .word 0

.balign 4
pattern: .asciz "%d"

.balign 4
lr_bu: .word 0

.text
.global main
.func main

main:

 ldr r1, adr_lr_bu
 str lr, [r1]

 ldr r0, adr_prompt
 bl printf 

 ldr r0, adr_pattern
 ldr r1, adr_temp
 bl scanf

 ldr r1, adr_temp
 ldr r1, [r1]

 cmp r1, #10
 bgt good
 blt bad

 bad: 
  ldr r0, adr_error_message
  bl printf
  b end

 good:
  cmp r1, #100
  bgt bad
  
  cmp r1, #40
  blt pants
  bgt shorts
  b end

 shorts:

  ldr r0, adr_msg_shorts
  bl printf
  b end

 pants:
  ldr r0, adr_msg_pants
  bl printf
  b end

 end: 

  ldr lr, adr_lr_bu
  ldr lr, [lr]
  bx lr

 adr_prompt : .word prompt
 adr_temp : .word temp
 adr_error_message: .word error_message
 adr_msg_shorts: .word msg_shorts
 adr_msg_pants: .word msg_pants
 adr_pattern : .word pattern
 adr_lr_bu: .word lr_bu

.global printf
.global scanf
