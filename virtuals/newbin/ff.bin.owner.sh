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
WHO="faron:faron"
if [[ "$1" = "33" ]]; then WHO="www-data:www-data"; fi
if [[ "$1" = "0" ]]; then WHO="root:root"; fi
if [[ "$1" = "666" ]]; then WHO="nobody:nogroup"; fi
CMD="chown $WHO $PWD/*; chown -R $WHO $PWD;"
if [[ "$EUID" != 0 ]]; then sudo $CMD; else $CMD; fi



################### END
cd $HERE
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.bin.read "
#  echo "example:  ff.bin.read  "
#fi
## TALON:
XeF


