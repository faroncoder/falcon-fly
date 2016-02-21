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
sudo chown -R faron:root $PWD/*; sudo chmod -R 775 $PWD/*;

################### END
cd $HERE
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.bin.fix "
#  echo "example:  ff.bin.fix  "
#fi
## TALON:
XeF


