#!/bin/sh

# Set time limit for all operations
ulimit -t 30

SignalError() {
    if [ $error -eq 0 ] ; then
	echo "FAILED"
	error=1
    fi
    echo "  $1"
}

# Compare <outfile> <reffile> <difffile>
Compare() {
    if diff -b "$1" "$2" 
    then echo "##TEST SUCCESS" && rm -f $1
    else echo "##TEST FAIL $1 differs from $2" 
    fi
}

# Run <args>
Run() {
    eval $* 
}

Check() {
    error=0
    basename=`echo $1 | sed 's/.*\\///
                             s/.ted//'`
    reffile=`echo $1 | sed 's/.ted$//'`

    echo "###### Testing $basename"


    Run "./ted_test.sh" $reffile ">" ${basename}.i.out
    Compare ${basename}.i.out ${reffile}.out
    rm -f ${reffile}.o
    rm -f ${reffile}.asm
    rm -f $reffile
}

shift `expr $OPTIND - 1`

if [ $# -ge 1 ]
then
    files=$@
else
    files="tests/test-*.ted"
fi

for file in $files
do
    case $file in
	*test-*)
	    Check $file
	    ;;
    esac
done

