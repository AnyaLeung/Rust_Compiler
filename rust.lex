%{
#include <stdio.h>
#define LIST  strcat(buf, yytext)
#define token(t) {LIST; printf("<%s>\n", t);}
#define tokenInteger(t,i) {LIST; printf("<%s:%d>\n", t, i);}
#define tokenString(t,s) {LIST; printf("<%s:%s>\n", t, s);}
#define MAX_LINE_LENG 256

int linenum = 1;
char buf[MAX_LINE_LENG];
%}

letter [A-Za-z]
digit   [0-9]       
real -?(({digit}+)|({digit}*"."{digit}+)([Ee][+-]?{digit}+)?)
integer -?{digit}+ 
whitespace [ \t]+

%%
 /*keywords--optimizing? how deal with print?*/
"as" {token("as");}
"break" {token("break");}
"const" {token("const");}
"continue" {token("continue");}
"crate" {token("crate");}
"else" {token("else");}
"enum" {token("enum");}
"extern" {token("extern");}
"false" {token("false");}
"fn" {token("fn");}
"for" {token("for");}
"if" {token("if");}
"impl" {token("impl");}
 /* "in" {token("in");}  how to make sure not match printf*/
"let" {token("let");}
"loop" {token("loop");}
"match" {token("match");}
"mod" {token("mod");}
"move" {token("move");}
"mut" {token("mut");}
"pub" {token("pub");}
"ref" {token("ref");}
"return" {token("return");}
"Self" {token("Self");}
"self" {token("self");}
"static" {token("static");}
"struct" {token("struct");}
"super" {token("super");}
"trait" {token("trait");}
"true" {token("true");}
"type" {token("type");}
"unsafe" {token("unsafe");}
"use" {token("use");}
"where" {token("where");}
"while" {token("while");}
"abstract" {token("abstract");}
"alignof" {token("alignof");}
"become" {token("become");}
"box" {token("box");}
"do" {token("do");}
"final" {token("final");}
"macro" {token("macro");}
"offsetof" {token("offsetof");}
"override" {token("override");}
"priv" {token("priv");}
"proc" {token("proc");}
"pure" {token("pure");}
"sizeof" {token("sizeof");}
"typeof" {token("typeof");}
"unsized" {token("unsized");}
"virtual" {token("virtual");}
"yield" {token("yield");}

"(" {token("(");}
")" {token(")");}
"{" {token("{");}
"}" {token("}");}
"[" {token("[");}
"]" {token("]");}

 /*signs*/
"\n" {
    LIST;
    printf("%d:%s", linenum++, buf);
    buf[0] = '\0';
}

[ \t]* {LIST;}

 /* number--ok */
{integer} {tokenInteger("integer", atoi(yytext));}
{real} {token("real");}
 /*int*/

 /* string--ok */
\"({letter}*)\" {tokenString("string", yytext);}

 /*operator--?
">" 

 id
   *includes function name ???
   <ID: main>
 
({letter}({letter}|{digit}|_)*)|(_({letter}|{digit}|_)+) {printf("<ID: %c>", yytext);}
*/



 /*
"\n" {
    List;
    printf("%d: %s", linenum++, buf);
    buf[0] = '\0';
   }
   */

%%

 /*comments in lex starts with a whitespace*/
int main(int argc, char *argv[]){
    yylex();
    fflush(yyout);
    exit(0);
}
