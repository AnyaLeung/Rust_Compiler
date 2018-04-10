%{
#include <stdio.h>
#define MAX_LINE_LENG 256


int linenum = 1;
char buf[MAX_LINE_LENG];
%}

digit   [0-9]       
letter  [A-Za-z]

%%
 /*keywords--almost_finish*/
"fn" {printf("<'fn'>");}
 /*
"(" {printf(" <' );}
")" {printf(" <' );}
"{" {printf("<'
"}" {printf("<'
???
 */
"if" {printf("<'if'>");}
"else" {printf("<'else'>");}
"break" {printf("<'break'>");}
"continue" {printf("<'continue'>");}
"extern" {printf("<'extern'>");}
"while" {printf("<'while'>");}
"loop" {printf("<'loop'>");}
"static" {printf("<'static'>");}
"struct" {printf("<'struct'>");}
"let" {printf("<'let'>");}
"mut" {printf("<'mut'>");}
"type" {printf("<'type"'>");}
"true" {printf("<'true'>");}
"false" {printf("<'false'>");}
"for" {printf("<'for'>");}
"in" {printf("<'in'>");}
"return" {printf("<'return'>");}
 /* int? */
 /*{}, "" what?*/


/*string--almost*/
"letter*" {printf("<string>");}

 /*digit--almost*/
-?((digit+)|(digit*\.digit+)([eE][-+]?digit+)?)
{printf("<number>");}

 /*operator--?*/
">" 

 /*id
   *includes function name
 */
(letter)(letter|digit)*


\n {
    List;
    printf("%d: %s", linenum++, buf);
    buf[0] = '\0';
   }
%%

 /*comments in lex starts with a whitespace*/
