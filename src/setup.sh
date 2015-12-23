#!/bin/sh

sudo apt-get install phantomjs nodejs nodejs-legacy npm
sudo npm install phantom -g
sudo npm install phantom
sudo apt-get install opam gcc nasm

cd ../tests/
sudo npm install phantom
cd ../libparse/Test/
sudo npm install phantom
cd ../../src/

cp ted ../libparse/Test/
