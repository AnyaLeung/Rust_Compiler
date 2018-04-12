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
"as" {printf("<'as'>");}
"break" {printf("<'break'>");}
"const" {printf("<'const'>");}
"continue" {printf("<'continue'>");}
"crate" {printf("<'crate'>");}
"else" {printf("<'else'>");}
"enum" {printf("<'enum'>");}
"extern" {printf("<'extern'>");}
"false" {printf("<'false'>");}
"fn" {printf("<'fn'>");}
"for" {printf("<'for'>");}
"if" {printf("<'if'>");}
"impl" {printf("<'impl'>");}
"in" {printf("<'in'>");}
"let" {printf("<'let'>");}
"loop" {printf("<'loop'>");}
"match" {printf("<'match'>");}
"mod" {printf("<'mod'>");}
"move" {printf("<'move'>");}
"mut" {printf("<'mut'>");}
"pub" {printf("<'pub'>");}
"ref" {printf("<'ref'>");}
"return" {printf("<'return'>");}
"Self" {printf("<'Self'>");}
"self" {printf("<'self'>");}
"static" {printf("<'static'>");}
"struct" {printf("<'struct'>");}
"super" {printf("<'super'>");}
"trait" {printf("<'trait'>");}
"true" {printf("<'true'>");}
"type" {printf("<'unsafe'>");}
"unsafe" {printf("<'unsafe'>");}
"use" {printf("<'use'>");}
"where" {printf("<'where'>");}
"while" {printf("<'while'>");}
"abstract" {printf("<'abstract'>");}
"alignof" {printf("<'alignof'>");}
"become" {printf("<'become'>");}
"box" {printf("<'box'>");}
"do" {printf("<'do'>");}
"final" {printf("<'final'>");}
"macro" {printf("<'macro'>");}
"offsetof" {printf("<'offsetof'>");}
"override" {printf("<'override'>");}
"priv" {printf("<'priv'>");}
"proc" {printf("<'proc'>");}
"pure" {printf("<'pure'>");}
"sizeof" {printf("<'sizeof'>");}
"typeof" {printf("<'typeof'>");}
"unsized" {printf("<'unsized'>");}
"virtual" {printf("<'virtual'>");}
"yield" {printf("<'yield'>");}
 /*"" {printf("<''>");} */
"(" {printf("<'('>");}
")" {printf("<')'>");}


 /*
"(" {printf(" <' );}
")" {printf(" <' );}
"{" {printf("<'
"}" {printf("<'
???
 */
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
