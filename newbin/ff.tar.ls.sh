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
tar -tvf $1 | awk '{print $6}'
################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.tar.ls "
#  echo "example:  ff.tar.ls  "
#fi
## TALON:
XeF


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


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.tar.ls "
#  echo "example:  ff.tar.ls  "
#fi
## TALON:
XeF


