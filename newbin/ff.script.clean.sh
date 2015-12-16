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
FILEGET=$( IFS= find $1 -exec basename {} \; )
FILENAME=$( printf "$FILEGET" | sed 's/lab./ff./' )
less $FILEGET | sed '/#/d' | sed '/^$/d' > $FILENAME
echo "$FILEGET finalized as $FILENAME"
ff.script.kill $FILEGET

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: lab.script.clean "
#  echo "example:  lab.script.clean  "
#fi
## TALON:
XeF
