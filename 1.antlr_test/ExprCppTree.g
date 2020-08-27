/*grammar ExprCppTree;
 
options {
    language = C;
    output = AST;
    ASTLabelType=pANTLR3_BASE_TREE;
}
 
@header {
    #include <assert.h>
}
 
// The suffix '^' means make it a root.
// The suffix '!' means ignore it.
 
expr: multExpr ((PLUS^ | MINUS^) multExpr)*
    ;
 
PLUS: '+';
MINUS: '-';
 
multExpr
    : atom ((TIMES^ | DIV^ | MOD^) atom)*
    ;
 
TIMES: '*';
DIV: '/';
MOD: '%';
 
atom: INT
    | ID
    | '('! expr ')'!
    ;

defid_sub: ID
    | ID^ ASSIGN! expr;
defid: DEF^ defid_sub (','! defid_sub)* ';'!
    ;

DEF: 'def';

block: '{' block_stmt '}' -> ^(BLOCK block_stmt);
block_stmt: stmt*;
BLOCK: '__block__';

stmt: expr ';' NEWLINE -> expr  // tree rewrite syntax
    | ID ASSIGN expr ';' NEWLINE -> ^(ASSIGN ID expr) // tree notation
    | defid NEWLINE -> defid
    | block
    | NEWLINE ->   // ignore
    ;
 
ASSIGN: '=';
 
prog
    : (stmt {
        #ifdef INFOMSG
        pANTLR3_STRING s = $stmt.tree->toStringTree($stmt.tree);
             assert(s->chars);
             printf(" haizei tree \%s\n", s->chars);
            fflush(stdout);
        #endif    
        }
        )+
    ;
 
ID: ('a'..'z'|'A'..'Z') ('a'..'z' | 'A'..'Z' | '0'..'9')*;
INT: '~'? '0'..'9'+ ;
NEWLINE: '\r'? '\n' ;
WS : (' '|'\t')+ {$channel = HIDDEN;};*/
/*grammar ExprCppTree;
 
options {
    language = C;
    output = AST;
    ASTLabelType=pANTLR3_BASE_TREE;
}
 
@header {
    #include <assert.h>
}
 
// The suffix '^' means make it a root.
// The suffix '!' means ignore it.
 
expr: multExpr ((PLUS^ | MINUS^) multExpr)*
    ;
 
PLUS: '+';
MINUS: '-';
 
multExpr
    : atom ((TIMES^ |DIVISION^ |SURPLUS^) atom)*
    ;
 
TIMES: '*';
DIVISION: '/';
SURPLUS: '%';
atom: INT
    | ID
    | '('! expr ')'!
    ;
defid_sub: ID
    | ID^ ASSIGN! expr;

defid: DEF^ defid_sub (','! defid_sub)* ';'!
    ;


block: '{' block_stmt '}' -> ^(BLOCK block_stmt);
block_stmt: stmt*;
BLOCK: '__block__';

stmt: expr ';' NEWLINE -> expr  // tree rewrite syntax
    | ID ASSIGN expr ';' NEWLINE -> ^(ASSIGN ID expr) // tree notation
    | defid NEWLINE -> defid
    | block
    | NEWLINE ->   // ignore
    ;


 
ASSIGN: '=';
 
prog
    : (stmt {
        #ifdef DEBUG    
        pANTLR3_STRING s = $stmt.tree->toStringTree($stmt.tree);
             assert(s->chars);
             printf(" haizei tree \%s\n", s->chars);
        #endif    
        }
        )+
    ;
 
 //
ID: ('a'..'z'|'A'..'Z') ('a'..'z' | 'A'..'Z' | '0'..'9')*;
INT: '~'? '0'..'9'+ ;
NEWLINE: '\r'? '\n' ;
WS : (' '|'\t')+ {$channel = HIDDEN;};
END:';';
DEF:"def";*/
grammar ExprCppTree;
 
options {
    language = C;
    output = AST;
    ASTLabelType=pANTLR3_BASE_TREE;
}
 
@header {
    #include <assert.h>
}
 
// The suffix '^' means make it a root.
// The suffix '!' means ignore it.
 
expr: multExpr ((PLUS^ | MINUS^) multExpr)*
    ;
 
PLUS: '+';
MINUS: '-';
 
multExpr
    : atom ((TIMES^ | DIV^ | MOD^) atom)*
    ;
 
TIMES: '*';
DIV: '/';
MOD: '%';
 
atom: INT
    | ID
    | '('! expr ')'!
    ;

defid_sub: ID
    | ID^ ASSIGN! expr;
defid: DEF^ defid_sub (','! defid_sub)* ';'!
    ;

DEF: 'def';

block: '{' block_stmt '}' -> ^(BLOCK block_stmt);
block_stmt: stmt*;
BLOCK: '__block__';

stmt: expr ';' NEWLINE -> expr  // tree rewrite syntax
    | ID ASSIGN expr ';' NEWLINE -> ^(ASSIGN ID expr) // tree notation
    | defid NEWLINE -> defid
    | block NEWLINE -> block
    | NEWLINE ->   // ignore
    ;
 
ASSIGN: '=';
 
prog
    : (stmt {
        #ifdef DEBUG
            do {
                pANTLR3_STRING s = $stmt.tree->toStringTree($stmt.tree);
                if (s->chars == NULL) break;
                assert(s->chars);
                printf(" haizei tree \%s\n", s->chars);
                fflush(stdout);
            } while (0);
        #endif    
        }
        )+
    ;
 
ID: ('a'..'z'|'A'..'Z') ('a'..'z' | 'A'..'Z' | '0'..'9')*;
INT: '~'? '0'..'9'+ ;
NEWLINE: '\r'? '\n' ;
WS : (' '|'\t')+ {$channel = HIDDEN;};
