%{
#include <iostream>
#include <string>
#include <map>
#include <vector>
using namespace std;

#define LIST  strcat(buf, yytext)
#define token(t) {LIST; printf("<%s>\n", t);}
#define tokenInteger(t,i) {LIST; printf("<%s:%d>\n", t, i);}
#define tokenString(t,s) {LIST; printf("<%s:%s>\n", t, s);}
#define PrintLine(b) {printf("%d:%s", linenum++, buf);}
#define MAX_LINE_LENG 256
#define SymbolTable sym_t

int linenum = 1;
 /* int colnum = 1; */
char buf[MAX_LINE_LENG];
char strbuf[MAX_LINE_LENG];

class SymbolTable{
    public:
        vector<string> V;
        map<string, int> M;
        int size;
};

sym_t* st;

 /* functions */
sym_t* Create(void){
    st = new SymbolTable();
    st->size = 0;
}

int Insert(string s){
    (st->M).insert(pair<string,int>(s, st->size ));        
    (st->V).push_back(s);
    return (st->size)++;
    }

int LookUp(string s){
    if ((st->M).find(s)==(st->M).end()){
        return -1;
    } //s not in map M's keys
    else {
        return (st->M)[s];
    }
}

int Dump(void){
    for(std::vector<string>::iterator it=(st->V).begin(); it!=(st->V).end(); it++){
        cout << *it << endl;
        }
    return (st->V).size();
    }
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
    /*keywords "bool"|"break"|"char"|"continue"|"do"|"else"|"enum"|"extern"|"false"|"float"|"for"|"fn"|"if"|"in"|"let"|"loop"|"match"|"match"|"mut"|"print"|"println"|"pub"|"return"|"self"|"static"|"str"|"struct"|"true"|"use"|"where"|"while"
      booleans "true"|"false"
     */

%%
 /* ops and delimiters--ok */
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
"false" {token("FALSE");}
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
"true" {token("TRUE");}
"use" {token("USE");}
"where" {token("WHERE");}
"while" {token("while");}

 /* numbers--ok */
{integer} {tokenInteger("int", atoi(yytext));} 
{real} {token("real");}

 /* ID--ok */
{ID} {
         Insert(yytext);
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
