#!/bin/bash
HERE=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d'



################### END
cd $HERE
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.network.devices.sh "
#  echo "example:  ff.network.devices.sh  "
#fi
## TALON:
XeF


