%{
#include <stdio.h>
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

letter [A-Za-z]
digit   [0-9]       
real -?(({digit}+)|({digit}*"."{digit}+)([Ee][+-]?{digit}+)?)
integer -?{digit}+ 
whitespace [ \t]+
ID ({letter}({letter}|{digit}|_)*)|(_({letter}|{digit}|_)+)
delimiters ","|":"|";"|"{"|"}"|"["|"]"|"("|")"
ops "+"|"-"|"*"|"/"|"++"|"--"|"%|"<"|<="|">"|">="|"=="|"!="|"&&"|"||"|"!"|"="|"+="|"-="|"*="|"/="
keywords "bool"|"break"|"char"|"continue"|"do"|"else"|"enum"|"extern"|"false"|"float"|"for"|"fn"|"if"|"in"|"let"|"loop"|"match"|"match"|"mut"|"print"|"println"|"pub"|"return"|"self"|"static"|"str"|"struct"|"true"|"use"|"where"|"while"
booleans "true"|"false"

%%
 /* kws and ops--ok */
{booleans} {token(yytext);}
{keywords} {token(yytext);}
{ops} {token(yytext);}
{delimiters} {token(yytext);}

 /* number--ok */
 /*how to deal with int overflow?*/
{integer} {tokenInteger("integer", atoi(yytext));}
{real} {token("real");}

 /* string--not ok */
 /* "ab""ab" = string ab"ab */
\"({letter}*)\" {tokenString("str", yytext);}

 /* ID--ok put into symbol table*/
{ID} {tokenString("identifier", yytext);}

 /*other signs*/
"\n" {
    LIST;
    printf("%d:%s", linenum++, buf);
    buf[0] = '\0';
}

{whitespace} {LIST;}
 /* comments */
%%

// function def here

 /*comments in lex starts with a whitespace*/
int main(int argc, char *argv[]){
    yylex();
    fflush(yyout);
    exit(0);
}
