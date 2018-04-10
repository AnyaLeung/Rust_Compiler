%{
#include <stdio.h>
#define MAX_LINE_LENG 256


int linenum = 1;
char buf[MAX_LINE_LENG];
%}

digit   [0-9]       
letter  [A-Za-z]

%%
 /*keywords*/
"FN" {printf(" <FN> ");}
"(" {printf(" <(>" );}
")" {printf(" <)>" );}
"if" {printf(" <if> ");}
"while"{printf(" <while> ");}

 /*string*/
 /*digit*/
 /*operator*/
 /*id*/


\n {
    List;
    printf("%d: %s", linenum++, buf);
    buf[0] = '\0';
   }
%%

 /*comments in lex starts with a whitespace*/
