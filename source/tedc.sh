FILE=$1
TED="./ted $FILE.t"
ASSEMBLE="nasm -f elf64 $FILE.asm"
GCC="gcc $FILE.o -o $FILE"

if [ -f $FILE.asm ]; then
  rm $FILE.asm
fi


if [ -f $FILE.o ]; then
  rm $FILE.o
fi

$TED $INFILE
$ASSEMBLE
$GCC
