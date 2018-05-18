%{
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include "symboltable.h"
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#include <math.h>
using namespace std;

#define LIST  strcat(buf, yytext)
#define token(t) {LIST; return t;}
#define tokenInteger(t,i) {LIST; return INT_VAL;}
#define tokenString(t,s) {LIST; return STR_VAL;}
#define PrintLine(b) {printf("%d:%s", linenum++, buf);}
#define MAX_LINE_LENG 256

int linenum = 1;
char buf[MAX_LINE_LENG];
char strbuf[MAX_LINE_LENG];
%}

/* state */
%x SIG_COMMENT
%x MUL_COMMENT
%x STR_STA

letter [A-Za-z]
digit   [0-9]       
real -?(({digit}+)|({digit}*"."{digit}+)([Ee][+-]?{digit}+)?)
integer -?{digit}+ 
whitespace [ \t]
ID ({letter}({letter}|{digit}|_)*)|(_({letter}|{digit}|_)+)
delimiters ","|":"|";"|"{"|"}"|"["|"]"|"("|")"
sig_ops "+"|"-"|"*"|"/"|"%"|"<"|">"|"!"|"="
bin_ops "++"|"--"|">="|"<="|"=="|"!="|"&&"|"||"|"+="|"-="|"*="|"/="

%%
{sig_ops} {token(yytext[0]);}
{delimiters} {token(yytext[0]);}

 /* binary ops */
"++" {token(SELF_INCRE);}
"--" {token(SELF_DECRE);}
">=" {token(GRE_EQU);}
"<=" {token(SMA_EQU);}
"==" {token(EQUAL_TO);}
"!=" {token(NOT_EQUAL_TO);}
"&&" {token(ANDAND);}
"||" {token(OROR);}
"+=" {token(ADD_SELF);}
"-=" {token(MINUS_SELF);}
"*=" {token(MUL_SELF);}
"/=" {token(DIV_SELF);}

 /* keywords--ok */
"bool" {token(KW_BOOL);}
"break" {token(KW_BREAK);}
"char" {token(KW_CHAR);}
"continue" {token(KW_CONTINUE);}
"do" {token(KW_DO);}
"else" {token(KW_ELSE);}
"enum" {token(KW_ENUM);}
"extern" {token(KW_EXTERN);}
"float" {token(KW_FLOAT);}
"for" {token(KW_FOR);}
"fn" {token(KW_FN);}
"if" {token(KW_IF);}
"in" {token(KW_IN);}
"let" {token(KW_LET);}
"loop" {token(KW_LOOP);}
"match" {token(KW_MATCH);}
"mut" {token(KW_MUT);}
"print" {token(KW_PRINT);}
"println" {token(KW_PRINTLN);}
"pub" {token(KW_PUB);}
"return" {token(KW_RETURN);}
"self" {token(KW_SELF);}
"static" {token(KW_STATIC);}
"str" {token(KW_STR);}
"struct" {token(KW_STRUCT);}
"use" {token(KW_USE);}
"where" {token(KW_WHERE);}
"while" {token(KW_WHILE);}
"false" {
    yylval.bval = false;
    token(KW_FALSE);
}
"true" {
    yylval.bval = true;
    token(KW_TRUE);}

 /* numbers--ok */
{integer} {
    yylval.val = atoi(yytext);
    tokenInteger(INT, atoi(yytext));
          } 

{real} {
    yylval.dval = atof(yytext);
    /*token(REAL);*/}

 /* ID--ok */
{ID} {
         /*Insert(yytext);*/
         tokenString(ID, yytext);
         yylval.sval = new string(yytext);
     }

 /* string--ok */
 /* "ab""ab" = string ab"ab */
<INITIAL>["] {
    LIST;
        strbuf[0] = '\0';
            BEGIN STR_STA;
            }

<STR_STA>\"\" {
    LIST;
        strcat(strbuf, "\"");
        }

<STR_STA>[^"]* {
    LIST;
        strcat(strbuf, yytext);
        }

<STR_STA>["] {
    BEGIN INITIAL;
        /*tokenString("string", strbuf);*/
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
