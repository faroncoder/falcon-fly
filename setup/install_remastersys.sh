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
sudo add-apt-repository ppa:mutse-young/remastersys
ff.apt.update
ff.apt.fetch remastersys
################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: install_remastersys "
#  echo "example:  install_remastersys  "
#fi
## TALON:
XeF


