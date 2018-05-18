#!/bin/bash
bison -y -d parser.y
echo "parser ok"
flex scanner.l
echo "scanner ok"
g++ y.tab.c lex.yy.c -ll -ly
echo "get ./a.out"
echo "all finished"
