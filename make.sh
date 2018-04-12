#!/bin/bash
lex rust.lex
echo "get lex.yy.c"
gcc lex.yy.c -ll
ech "compile into a.out already"
