#!/bin/bash
if [ ! "$( echo $PATH | grep '/usr/local/bin/' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

dig $1 all | sed '/;/d' | sed '/^$/d'


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.dig.all "
#  echo "example:  ff.dig.all  "
#fi
## TALON:
XeF


