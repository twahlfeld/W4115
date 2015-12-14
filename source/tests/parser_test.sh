#!/bin/bash
MENHIR="menhir --interpret --interpret-show-cst ../parser.mly"

STRING_FUN="string sfun(string s) { return s; }"

printf "Test1:" $STRING_FUN && echo $STRING_FUN | $MENHIR
