all: ./ExprCppTree.g main.cpp
	java -jar ./antlr-3.4-complete.jar ExprCppTree.g
	g++ -std=c++11 -g -Wall *.cpp *.c ./libantlr3c-3.4/.libs/libantlr3c.a -I ./include/
debug: ./ExprCppTree.g main.cpp
	java -jar ./antlr-3.4-complete.jar ExprCppTree.g
	g++ -std=c++11 -DDEBUG -g -Wall *.cpp *.c ./libantlr3c-3.4/.libs/libantlr3c.a -I ./include/

run:
	./a.out input
