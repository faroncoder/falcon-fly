#!/bin/bash
if [ ! "$( echo $PATH | grep '/home/faron/.bin/' )" ]; then
	export PATH=$PATH:/home/faron/.bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

echo "You are firing: $PWD/$( basename $0 )"

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: test "
#  echo "example:  test  "
#fi
## TALON:
XeF


