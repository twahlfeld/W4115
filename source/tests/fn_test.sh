TED="../ted"
NEXT="echo Press enter to continue"
PROMPT="read answer"
FN="int fn() { int i; } int main() { }"
CAL_FN="int fn() { int i; } int main() { fn(); }"
FN_ARG="int fn(int a) { int i; } int main() { fn(1); }"
FN_ARG_ASGN="int fn(int a) { int i; i = a; } int main() { fn(1); }"
PR_FN="int pr(int a) { int s = a; print(stdout, \"hello world\"); } int main() { int a; pr(a); }"

printf "Test1: $FN\n"
echo "$FN" | $TED
$NEXT && $PROMPT

printf "Test2: $CAL_FN\n"
echo "$CAL_FN" | $TED
$NEXT && $PROMPT

printf "Test3: $FN_ARG\n"
echo "$FN_ARG" | $TED
$NEXT && $PROMPT

printf "Test3: $FN_ARG_ASGN\n"
echo "$FN_ARG_ASGN" | $TED
$NEXT && $PROMPT

printf "Test3: $PR_FN\n"
echo "$PR_FN" | $TED
$NEXT && $PROMPT

