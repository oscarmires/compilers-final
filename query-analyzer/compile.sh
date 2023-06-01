#!/bin/bash

yacc -d parser.y
lex lexer.l  
gcc -o analyzer y.tab.c lex.yy.c -ly -ll
