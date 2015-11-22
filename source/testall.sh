#!/bin/sh

TED="./ted"

# Set time limit for all operations
ulimit -t 30

#globallog=testall.log
#rm -f $globallog
#error=0
#globalerror=0

#keep=0

#Usage() {
#    echo "Usage: testall.sh [options] [.ted files]"
#    echo "-k    Keep intermediate files"
#    echo "-h    Print this help"
#    exit 1
#}

SignalError() {
    if [ $error -eq 0 ] ; then
	echo "FAILED"
	error=1
    fi
    echo "  $1"
}

# Compare <outfile> <reffile> <difffile>
# Compares the outfile with reffile.  Differences, if any, written to difffile
Compare() {
    #generatedfiles="$generatedfiles $3" 
    #echo diff -b $1 $2
    #diff -b "$1" "$2" || {
	#SignalError "$1 differs"
	#echo "FAILED $1 differs from $2" 1>&2
    #}
    if diff -b "$1" "$2" 
    then echo "##TEST SUCCESS" && rm -f $1
    else echo "##TEST FAIL $1 differs from $2" 
    fi
}

# Run <args>
# Report the command, run it, and report any errors
Run() {
    #echo $* 
    eval $* 
    #|| {
	#SignalError "$1 failed on $*"
	#return 1
    #}
}

Check() {
    error=0
    basename=`echo $1 | sed 's/.*\\///
                             s/.ted//'`
    reffile=`echo $1 | sed 's/.ted$//'`
    basedir="`echo $1 | sed 's/\/[^\/]*$//'`/"

    #echo -n "$basename..."

    #echo 1>&2
    echo "###### Testing $basename"

   # generatedfiles=""

   # generatedfiles="$generatedfiles ${basename}.i.out" &&
    Run "./ted_test.sh" $reffile ">" ${basename}.i.out
    Compare ${basename}.i.out ${reffile}.out
    rm -f ${reffile}.o
    rm -f ${reffile}.asm
    rm -f $reffile

   # generatedfiles="$generatedfiles ${basename}.c.out" &&
   # Run "$TED" "-c" "<" $1 ">" ${basename}.c.out &&
   # Compare ${basename}.c.out ${reffile}.out ${basename}.c.diff

    # Report the status and clean up the generated files

    #if [ $error -eq 0 ] ; then
	#if [ $keep -eq 0 ] ; then
	#    rm -f $generatedfiles
	#fi
	#echo "OK"
	#echo "###### SUCCESS" 1>&2
    #else
	#echo "###### FAILED" 1>&2
	#globalerror=$error
    #fi
}

while getopts kdpsh c; do
    case $c in
	k) # Keep intermediate files
	    keep=1
	    ;;
	h) # Help
	    Usage
	    ;;
    esac
done

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
#    *fail-*)
#        CheckFail $file 2>> $globallog
#        ;;
#	*)
#	    echo "unknown file type $file"
#	    globalerror=1
#	    ;;
    esac
done

exit $globalerror
