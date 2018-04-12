%{
#include <stdio.h>
#define List strcat(buf, yytext)
#define token(t) {LIST; printf("<%s>\n", "t");}
#define tokenInteger(t, i) {LIST; printf("<%s:%d>\n", "t", i);}
#define tokenReal(t, )
#define tokenString(t, s) {LIST; printf("<%s:%s\n", "t", s);}
#define MAX_LINE_LENG 256

int linenum = 1;
char buf[MAX_LINE_LENG];
%}

letter [A-Za-z]
digit   [0-9]       
real -?(({digit}+)|({digit}*"."{digit}+)([Ee][+-]?{digit}+)?)
whitespace [ \t]+
 /* integer -?{digit}+ 
  plain_real -?{digit}+"."{digit}+
  expreal -?{digit}*"."{digit}+[Ee][+-]?{digit}+
  real {integer}|{plain_real}|{expreal}
 */

%%
 /*keywords--almost_finish*/
"as" {token('as');}
"fn" {token('fn');}
%%

 /*comments in lex starts with a whitespace*/
int main(int argc, char *argv[]){
    yylex();
    fflush(yyout);
    exit(0);
}

