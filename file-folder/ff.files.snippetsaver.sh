#!/bin/bash
if [ "$( echo $PATH | grep '/home/faron/.bin/' )" = '' ]; then
	export PATH=$PATH:/home/faron/.bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

COLELCT=( `find -L /home/faron/.falcon/code/sublime/User -maxdepth 1 -type f -name '*-snippet' -exec basename {} \;` )
if [  "$COLELCT" != '' ]; then
	for snippet in "${COLELCT[@]}"; do
		logger "$( `basename $0` ) : $snippet moved"
		mv "home/faron/.falcon/code/sublime/User/$snippet" "/home/faron/.falcon/code/sublime/mysnippets/$snippet" 2> /dev/null
		#DISPLAY=:0.0
		notify-send "Snippet found and special archived"
	done
fi


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage:  "
#  echo "example:    "
#fi
## TALON:
XeF
