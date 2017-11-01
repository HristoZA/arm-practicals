rename: rename.o
	gcc -o rename rename.o
rename.o: rename.s
	as -o rename.o rename.s
clean:
	rm *.o rename
debug: 
	as -g -o rename.o rename.s
	gcc -o rename rename.o    
	gdb rename