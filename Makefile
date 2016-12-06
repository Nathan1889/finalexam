all:install 
install:count document
count:main.o
	g++ main.o -o count
main.o: main.cc
	g++ main.cc -c
document: html/index.html
html/index.html: main.cc
	doxygen main.cc
check:
	cppcheck main.cc
	valgrind ./count
clean: 
	-rm -r count *.out *.o html latex
