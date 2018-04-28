#!/bin/bash
lex rust.lex
echo "get lex.yy.c"
g++ lex.yy.c -ll
echo "compile into a.out already"
