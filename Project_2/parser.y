%{
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include "symboltable.h"

using namespace std;
int yyerror(string s);
int yylex();
%}

%union{
    int val;
    double dval;
    bool bval;
    string* sval;
    /* sym_table_id tabval; */
}

%token <val> INT_VAL
%token <dval> DOUBLE_VAL
%token <sval> STR_VAL
%token <sval> ID_VAL
%token <bval> BOOL_VAL

/* keywords */
%token BOOL BREAK CHAR CONTINUE DO ELSE ENUM EXTERN FALSE FLOAT FOR FN IF IN INT LET LOOP MATCH MUT PRINT
%token PRINTLN PUB RETURN SELF STATIC STR STRUCT TRUE USE WHERE WHILE
 /* yacc declarations */
%%
 /* grammar rules */
expr: expr'+'INT
    |expr'-'INT
    |INT
    |BOOL
    |BREAK
    ;
%%
 
int yyerror(string s){
    cout << "wrong!" << endl;
    /*cout << "Line " << linenum << s;
    cout << " ,an error generated." << endl;
    */
    return 0;
}

int main(void){
    yyparse();
    return 0;
}
