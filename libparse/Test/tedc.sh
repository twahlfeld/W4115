FILE=$1
COMPILE="ted $FILE.ted"
ASSEMBLE="nasm -f elf64 $FILE.asm"
GCC="gcc -static $FILE.o -L. -lparse -o $FILE"

$COMPILE
$ASSEMBLE
$GCC
