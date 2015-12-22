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

HUNTFILE=( `find -L /media/falcon/code/sublime/User -maxdepth 1 -type f -name '*-snippet'  `  )
if [[ ! -z "$HUNTFILE" ]]; then
        for snippet in "${HUNTFILE[@]}"; do
        	FILEME=$( basename $snippet )
        	logger "Found: $FILE and moving to resident folder"
        	mv $snippet /media/falcon/code/sublime/mysnippets/
        	CHECKME=$( ls -al /media/falcon/code/sublime/mysnippets/$FILEME )
        	if [[ ! -z "$FILEME" ]]; then
        		echo "$FILEME secured."
        	fi
        	ff.notify.echo "Found: $( basename $snippet )" < /dev/null
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
