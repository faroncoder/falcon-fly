#!/bin/bash
if [ "$( echo $PATH | grep '/usr/local/bin/' )" = '' ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

HUNTFILE=( `find -L /home/users/faron/.falcon/code/sublime/User -maxdepth 1 -type f -name '*-snippet'  `  )
if [[ ! -z "$HUNTFILE" ]]; then
        for snippet in "${HUNTFILE[@]}"; do
        	FILEME=$( basename $snippet )
        	logger "Found: $FILE and moving to resident folder"
        	mv $snippet /home/users/faron/.falcon/code/sublime/mysnippets/
        	CHECKME=$( ls -al /home/users/faron/.falcon/code/sublime/mysnippets/$FILEME )
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
