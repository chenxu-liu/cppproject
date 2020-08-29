/*************************************************************************
	> File Name: main.cpp
	> Author: huguang
	> Mail: hug@haizeix.com
	> Created Time: 一  8/24 10:24:49 2020
 ************************************************************************/

#include <hythonLexer.h>
#include <hythonParser.h>
#include <cassert>
#include <map>
#include <string>
#include <iostream>
#include <ExprTreeEvaluator.h>
#include <AST.h>
 
int main(int argc, char* argv[]) {
    assert(argc > 1);
    haizei::ASTNode tree(argv[1]);
    
    ExprTreeEvaluator eval;
    int rr = eval.run(tree);
    tree.destroy();
    return 0;
}

