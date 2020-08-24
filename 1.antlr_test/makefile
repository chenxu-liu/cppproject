all: ./ExprCppTree.g main.cpp
	java -jar ./antlr-3.4-complete.jar ExprCppTree.g
	g++ -g -Wall *.cpp *.c ./libantlr3c-3.4/.libs/libantlr3c.a -I ./include/
debug: ./ExprCppTree.g main.cpp
	java -jar ./antlr-3.4-complete.jar ExprCppTree.g
	g++ -DINFOMSG -g -Wall *.cpp *.c ./libantlr3c-3.4/.libs/libantlr3c.a -I ./include/
