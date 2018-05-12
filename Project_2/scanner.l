%{
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include "symboltable.h"
#include <stdio.h>
#include <stdlib.h>
#include "flex_memory_fix.h"
#include "y.tab.h"
#include <math.h>
using namespace std;

#define LIST  strcat(buf, yytext)
#define token(t) {LIST; return yytext[0];}
#define tokenInteger(t,i) {LIST; return yytext[0];}
#define tokenString(t,s) {LIST; return yytext[0];}
#define PrintLine(b) {printf("%d:%s", linenum++, buf);}
#define MAX_LINE_LENG 256

int linenum = 1;
char buf[MAX_LINE_LENG];
char strbuf[MAX_LINE_LENG];
%}

 /* state */
%x SIG_COMMENT
%x MUL_COMMENT
%x  STR

letter [A-Za-z]
digit   [0-9]       
real -?(({digit}+)|({digit}*"."{digit}+)([Ee][+-]?{digit}+)?)
integer -?{digit}+ 
whitespace [ \t]
ID ({letter}({letter}|{digit}|_)*)|(_({letter}|{digit}|_)+)
delimiters ","|":"|";"|"{"|"}"|"["|"]"|"("|")"
ops "+"|"-"|"*"|"/"|"++"|"--"|"%"|"<"|"<="|">"|">="|"=="|"!="|"&&"|"||"|"!"|"="|"+="|"-="|"*="|"/="

%%
{ops} {token(yytext);}
{delimiters} {token(yytext);}

 /* keywords--ok */
"bool" {token("BOOL");}
"break" {token("BREAK");}
"char" {token("CHAR");}
"continue" {token("CONTINUE");}
"do" {token("DO");}
"else" {token("ELSE");}
"enum" {token("ENUM");}
"extern" {token("EXTERN");}
"float" {token("FLOAT");}
"for" {token("FOR");}
"fn" {token("FN");}
"if" {token("IF");}
"in" {token("IN");}
"let" {token("LET");}
"loop" {token("LOOP");}
"match" {token("MATCH");}
"mut" {token("MUT");}
"print" {token("PRINT");}
"println" {token("PRINTLN");}
"pub" {token("PUB");}
"return" {token("RETURN");}
"self" {token("SELF");}
"static" {token("STATIC");}
"str" {token("STR");}
"struct" {token("STRUCT");}
"use" {token("USE");}
"where" {token("WHERE");}
"while" {token("while");}
"false" {
    yyla.value = false;
    token("FALSE");
        }
"true" {
    yylval.bval = true;
    token("TRUE");}

 /* numbers--ok */
{integer} {
    yylval.val = atoi(yytext);
    tokenInteger("int", atoi(yytext));
          } 

{real} {
    yylval.dval = atof(yytext);
    token("real");}

 /* ID--ok */
{ID} {
         Insert(yytext);
         yylval.sval = new string(yytext);
         tokenString("ID", yytext);
     }

 /* string--ok */
 /* "ab""ab" = string ab"ab */
<INITIAL>["] {
    LIST;
        strbuf[0] = '\0';
            BEGIN STR;
            }

<STR>\"\" {
    LIST;
        strcat(strbuf, "\"");
        }

<STR>[^"]* {
    LIST;
        strcat(strbuf, yytext);
        }

<STR>["] {
    BEGIN INITIAL;
        tokenString("string", strbuf);
            strbuf[0] = '\0';
            }
 /* why use buf here makes <string:abc"> ???*/

 /*comments--ok*/
 /* single line comments */
<INITIAL>"//" {
    LIST; 
    BEGIN SIG_COMMENT;
}

<SIG_COMMENT>"\n" {
    LIST;
    PrintLine(buf);
    buf[0] = '\0';
    BEGIN INITIAL;
}

<SIG_COMMENT>. {
    LIST;
}

 /* multi line comments */
<INITIAL>"/*" {
    LIST;
    BEGIN MUL_COMMENT;
}

<MUL_COMMENT>"\n" {
    LIST;
    PrintLine(buf);
    buf[0] = '\0';
}

<MUL_COMMENT>"*/" {
    LIST;
    BEGIN INITIAL;
}

<MUL_COMMENT>. {
    LIST;
}

 /* other signs */
"\n" {
    LIST;
    PrintLine(buf);
    buf[0] = '\0';
}

{whitespace}* {LIST;}

. {
    LIST;
    printf("%d:%s\n", linenum, buf);
    printf("bad character:'%s'\n", yytext);
    exit(-1);
}
%%

 /*comments in lex starts with a whitespace*/
int main(int argc, char *argv[]){
    Create();
    yylex();
    printf("\nSymbol Table: \n");
    Dump();
    fflush(yyout);
    exit(0);
}
