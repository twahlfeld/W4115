TED="../ted"
NEXT="echo Press enter to continue"
PROMPT="read answer"
FN="fn() { int i; } main() { }"
CAL_FN="fn() { int i; } main() { fn(); }"
FN_ARG="fn(a) { int i; } main() { fn(1); }"
FN_ARG_ASGN="fn(a) { int i; i = a; } main() { fn(1); }"
PR_FN="pr(a) { int s = a; print(stdout, \"hello world\"); } main() { pr(a); }"

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

