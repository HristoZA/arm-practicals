# (static) library
as -o libglobal.o global.s
ar cru libglobal.a libglobal.o
# program
as -o main.o main.s
gcc -o main.o -L. -l:libglobal.a
