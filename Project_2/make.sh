#!/bin/bash
lex scanner.l
echo "get lex.yy.c"
g++ lex.yy.c -ll
echo "compile into a.out already"
