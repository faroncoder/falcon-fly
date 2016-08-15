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

MODSENABLE=( FARONFUCKSIN )
for m in "${MODSENABLE}"; do
	sudo a2enmod $m 2>&1 /dev/null


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: lab.apache2.enable "
#  echo "example:  lab.apache2.enable  "
#fi
## TALON:
XeF


