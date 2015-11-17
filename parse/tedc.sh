FILE=$1
ASSEMBLE="nasm -f elf64 $FILE.asm"
GCC="gcc -static $FILE.o -L. -lparse -o $FILE"

$ASSEMBLE
$GCC
