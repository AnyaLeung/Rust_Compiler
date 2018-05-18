#! /bin/bash
bison -y -d parser.y
flex scanner.l
gcc y.tab.tc lex.yy.c -ll -ly
./a.out
