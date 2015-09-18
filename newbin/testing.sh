#!/bin/bash
if [ "$( echo $PATH | grep '/home/faron/.bin/' )" = '' ]; then
	export PATH=$PATH:/home/faron/.bin:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> ~/.falcon/logs/scripts.log; exit 0 
}

#if [ "$1" != "" ]; then
#################### BEGIN

echo "can you see me?"


################### END
#elif [ "$1" = "" ];
#	then
#  echo "usage: testing.sh "
#  echo "example:    "
#fi


## TALON: testing.sh
XeF


