sort: sort.o
	gcc -o sort sort.o
sort.o: sort.s
	as -o sort.o sort.s
clean:
	rm *.o sort
debug: 
	as -g -o sort.o sort.s
	gcc -o sort sort.o    
	gdb sort