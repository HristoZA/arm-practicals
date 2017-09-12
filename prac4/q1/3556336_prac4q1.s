.data

.balign 4
arr: .skip 40

.text
.global main
main:

	ldr r1, adr_arr       	@ r1 ← arr */
	mov r2, #0              	@ r2 ← 0 */
	b loop 
	
	loop:
	    cmp r2, #10            
	    beq end                 
	    add r3, r1, r2, LSL #2 	@ r3 ← r1 + r2 * 4 
	    str r2, [r3]          	@ *r3 ← r2 
	    add r2, r2, #1        	@ r2 ← r2 + 1 
	    b loop               	@ Go to the beginning of the loop 
	
	end:
	
		bx lr

adr_arr: .word arr
