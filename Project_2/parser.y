%{
#include <iostream>
#include <stdio.h>
#include <map>
#include <vector>
#include "lex.yy.c"
#include "symboltable.h"

using namespaces std;
%}

%union{
    int ival;
    bool bval;
    double dval;
    string sval;
}

%token <ival> INT
%token <dval> DOUBLE
%token <sval> STRING
%token <bval> BOOL
%token <sval> ID


 /* keywords */
%token BOOL
%token BREAK
%token CHAR
%token CONTINUE
%token DO
%token ELSE
%token ENUM
%token EXTERN
%token FALSE
%token FLOAT
%token FOR
%token FN
%token IF
%token IN
%token LET
%token LOOP
%token MATCH
%token MUT
%token PRINT
%token PRINTLN
%token PUB
%token RETURN
%token SELF
%token STATIC
%token STR
%token STRUCT
%token TRUE
%token USE
%token WHERE
%token WHILE
 /* yacc declarations */
%%
 /* grammar rules */
%%
int main(void){
    yyparse();
    return 0;
}
