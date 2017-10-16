3556336_prac6q2: 3556336_prac6q2.o
	gcc -o 3556336_prac6q2 3556336_prac6q2.o
3556336_prac6q2.o: 3556336_prac6q2.s
	as -o 3556336_prac6q2.o 3556336_prac6q2.s
clean:
	rm *.o 3556336_prac6q2
debug: 
	as -g -o 3556336_prac6q2.o 3556336_prac6q2.s
	gcc -o 3556336_prac6q2 3556336_prac6q2.o    
	gdb 3556336_prac6q2