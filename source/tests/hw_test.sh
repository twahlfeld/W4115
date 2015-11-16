TED="../ted"
NEXT="echo Press enter to continue"
PROMPT="read answer"
ADD="add(x, y) { return x + y; }"
MINUS="minus(x, y) { return x - y; }"
DIVIDE="divide(x, y) { return x / y; }"
MULT="mult(x, y) { return x * y; }"
MAIN="main() { int x; int y; int z; x = 2; y = 3; z = add(x, y); }"

printf "Test 1: main() { };\n" 
echo "main() { }" | $TED
$NEXT && $PROMPT

printf "Test 2: main() { int i; }\n"
echo "main() { int i; }" | $TED
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
