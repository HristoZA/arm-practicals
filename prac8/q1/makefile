3556336_prac8q1: 3556336_prac8q1.o
	gcc -o 3556336_prac8q1 3556336_prac8q1.o
3556336_prac8q1.o: 3556336_prac8q1.s
	as -o 3556336_prac8q1.o 3556336_prac8q1.s
clean:
	rm *.o 3556336_prac8q1
debug: 
	as -g -o 3556336_prac8q1.o 3556336_prac8q1.s
	gcc -o 3556336_prac8q1 3556336_prac8q1.o    
	gdb 3556336_prac8q1