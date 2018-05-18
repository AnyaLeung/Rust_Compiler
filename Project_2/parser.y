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
%token KW_BOOL 
%token KW_BREAK 
%token KW_CHAR 
%token KW_CONTINUE 
%token KW_DO   
%token KW_ELSE 
%token KW_ENUM 
%token KW_EXTERN 
%token KW_FALSE 
%token KW_FLOAT 
%token KW_FOR 
%token KW_FN 
%token KW_IF 
%token KW_IN 
%token KW_LET 
%token KW_LOOP 
%token KW_MATCH 
%token KW_MUT 
%token KW_PRINT
%token KW_PRINTLN 
%token KW_PUB 
%token KW_RETURN 
%token KW_SELF 
%token KW_STATIC 
%token KW_STR 
%token KW_STRUCT 
%token KW_TRUE 
%token KW_USE 
%token KW_WHERE 
%token KW_WHILE

 /* binary ops */
%token SELF_INCRE 
%token SELF_DECRE
%token GRE_EQU
%token SMA_EQU
%token EQUAL_TO
%token NOT_EQUAL_TO
%token ANDAND
%token OROR
%token ADD_SELF
%token MINUS_SELF
%token MUL_SELF
%token DIV_SELF

 /* precedence and associativity */
 %left OROR 
 %left ANDAND
 %left '<' '>' NOT_EQUAL_TO GRE_EQU SMA_EQU EQUAL_TO
 %left '+' '-' '|'
 %left '*' '/' '%' '&'
 %left '^'
 %nonassoc UMINUS UPLUS
 /* yacc declarations */
%%
 /* grammar rules */
expr: expr'+'INT_VAL
    |expr'-'INT_VAL
    |INT_VAL
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
