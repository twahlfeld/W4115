TED="../ted"
NEXT="echo Press enter to continue"
PROMPT="read answer"
ADD="int add(x, y) { return x + y; }"
MINUS="int minus(x, y) { return x - y; }"
DIVIDE="int divide(x, y) { return x / y; }"
MULT="int mult(x, y) { return x * y; }"
MAIN="int main() { int x; int y; int z; x = 2; y = 3; z = add(1, 2); }"
PRINT="int main() { print(stdout, \"This\"); return 0; }"

printf "Test 1: main() { };\n" 
echo "int main() { }" | $TED
$NEXT && $PROMPT

printf "Test 2: main() { int i; i = 5; }\n"
echo "int main() { int i; i = 5; }" | $TED
$NEXT && $PROMPT

printf "Test4: $ADD\n"
echo "$ADD" | $TED
$NEXT && $PROMPT

printf "Test5: $MINUS\n"
echo "$MINUS" | $TED
$NEXT && $PROMPT

printf "Test6: $DIVIDE\n"
echo "$DIVIDE" | $TED
$NEXT && $PROMPT

printf "Test7: $MULT\n"
echo "$MULT" | $TED
$NEXT && $PROMPT

printf "Test8: $ADD $MINUS $MULT $DIVIDE $MAIN\n"
echo "$ADD $MINUS $MULT $DIVIDE $MAIN" | $TED
$NEXT && $PROMPT

printf "Test9: $PRINT\n"
echo "$PRINT" | $TED
$NEXT && $PROMPT

