#!/usr/bin/env bash

wget \"$1\" -o page.html
tidy -q -asxml page.html >page.xml
rm -rf page.html
