test: test.o
	gcc -o test test.o
test.o: test.s
	as -o test.o test.s
clean:
	rm *.o test
debug: 
	as -g -o test.o test.s
	gcc -o test test.o    
	gdb test