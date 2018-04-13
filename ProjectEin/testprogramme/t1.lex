%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#define LIST  strcat(buf, yytext)
#define token(t) {LIST; printf("<%s>\n", t);}
#define tokenInteger(t,i) {LIST; printf("<%s:%d>\n", t, i);}
#define tokenString(t,s) {LIST; printf("<%s:%s>\n", t, s);}
#define MAX_LINE_LENG 256

int linenum = 1;
int colnum = 1;
char buf[MAX_LINE_LENG];
%}

 /* state */
%s SIG_COMMENT
%s MUL_COMMENT

keywords "bool"|"break"|"char"|"continue"|"do"|"else"|"enum"|"extern"|"false"|"float"|"for"|"fn"|"if"|"in"|"let"|"loop"|"match"|"match"|"mut"|"print"|"println"|"pub"|"return"|"self"|"static"|"str"|"struct"|"true"|"use"|"where"|"while"

%%
 /* kws and ops--ok */
 {keywords} {token(toupper(yytext));} 
%%

// function def here

 /*comments in lex starts with a whitespace*/
int main(int argc, char *argv[]){
    yylex();
    fflush(yyout);
    exit(0);
}
