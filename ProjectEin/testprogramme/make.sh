#!/bin/bash
lex test.lex
echo "get lex.yy.c"
gcc lex.yy.c -ll
echo "compile into a.out already"
