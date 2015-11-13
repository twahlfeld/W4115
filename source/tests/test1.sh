#!/bin/bash
MENHIR="menhir --interpret --interpret-show-cst ../parser.mly"
TEST1="INT ID SEMI"
TEST2="INT ID ASSIGN ID SEMI"
TEST3="LIST ID ASSIGN ID SEMI"
TEST4="INT ID ASSIGN LITERAL PLUS LITERAL DIVIDE LPAREN LITERAL PLUS ID RPAREN SEMI"
TEST5="FOR LPAREN ID ASSIGN LITERAL SEMI ID LT LITERAL SEMI ID ASSIGN ID PLUS LITERAL RPAREN LBRACE ID ASSIGN ID PLUS LITERAL SEMI RBRACE" 
TEST6="WHILE LPAREN ID GT LITERAL RPAREN LBRACE ID ASSIGN ID MINUS LITERAL SEMI RBRACE"
TEST7="LBRACE LITERAL SEMI RBRACE"
TEST8="LITERAL SEMI"
TEST9="RETURN LITERAL SEMI"
TEST10="ID LPAREN RPAREN LBRACE RBRACE"
TEST11="ID LPAREN ID COMMA ID RPAREN LBRACE INT ID ASSIGN ID SEMI RBRACE"
TEST12="STRING ID SEMI"
TEST13="$TEST1 $TEST3 $TEST11"
TEST14="INT ID ASSIGN ID LPAREN RPAREN SEMI"
TEST15="ID LPAREN RPAREN LBRACE $TEST1 $TEST3 $TEST5 $TEST6 $TEST9 RBRACE $TEST14"
printf "Performing test 1: parser \n1: $TEST1 declaration/int... " && echo $TEST1 | $MENHIR
echo "Press enter to continue." && read answer
printf "2: $TEST2 assignment ... " && echo $TEST2 | $MENHIR
echo "Press enter to continue." && read answer
printf "3: $TEST3 assign... " && echo $TEST3 | $MENHIR
echo "Press enter to continue." && read answer
printf "4: $TEST4 complex assign/parens... " && echo $TEST4 | $MENHIR
echo "Press enter to continue." && read answer
printf "5: $TEST5 for loop... " && echo $TEST5 | $MENHIR
echo "Press enter to continue." && read answer
printf "6: $TEST6 while loop... " && echo $TEST6 | $MENHIR
echo "Press enter to continue." && read answer
printf "7: $TEST7 statement block... " && echo $TEST7 | $MENHIR
echo "Press enter to continue." && read answer
printf "8: $TEST8 simplest statement... " && echo $TEST8 | $MENHIR
echo "Press enter to continue." && read answer
printf "9: $TEST9 return... " && echo $TEST9 | $MENHIR
echo "Press enter to continue." && read answer
printf "10: $TEST10 fdecl basic... " && echo $TEST10 | $MENHIR
echo "Press enter to continue." && read answer
printf  "11: $TEST11 fdecl complex..." && echo $TEST11 | $MENHIR
echo "Press enter to continue." && read answer
printf "12: $TEST12 string decl... " && echo $TEST12 | $MENHIR
echo "Press enter to continue." && read answer
printf "13: $TEST13 vdecls and fdecl... " && echo $TEST13 | $MENHIR
echo "Press enter to continue." && read answer
printf "14: $TEST14 basic func call... " && echo $TEST14 | $MENHIR
echo "Press enter to continue." && read answer
printf "15: $TEST15 complex func decl and all... " && echo $TEST15 | $MENHIR
