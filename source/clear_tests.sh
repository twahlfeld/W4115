rm -f test-*.i.out
rm -f tests/*.asm
rm -f tests/*.o
find tests -type f -executable (!parser_test.sh) -delete
