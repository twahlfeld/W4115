#!/bin/bash
MENHIR="menhir --interpret --interpret-show-cst ../parser.mly"
TEST1="INT ID SEMI"
TEST2="FLOAT ID ASSIGN FLITERAL SEMI"
TEST3="LIST ID ASSIGN ID SEMI"
TEST4="INT ID ASSIGN LITERAL PLUS LITERAL DIVIDE LPAREN LITERAL PLUS ID RPAREN SEMI"
TEST5="FOR LPAREN ID ASSIGN LITERAL SEMI ID LT LITERAL SEMI ID ASSIGN ID PLUS LITERAL RPAREN LBRACE ID ASSIGN ID MOD LITERAL SEMI RBRACE" 
printf "Performing test 1: parser \n$TEST1 declaration/int..."
echo $TEST1 | $MENHIR
printf "$TEST2 assignment/float ..." 
echo $TEST2 | $MENHIR
printf "$TEST3 assign list to id..."
echo $TEST3 | $MENHIR
printf "$TEST4 complex assign/parens..."
echo $TEST4 | $MENHIR
printf "$TEST5 for loop..."
echo $TEST5 | $MENHIR




