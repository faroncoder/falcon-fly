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

GETALL=( $( find . -maxdepth 1 -type f -exec basename {} \; ) )
for n in "${GETALL[@]}"; do
		STPLOC=$( dirname $n )
		STPFILE=$( basename $n );
		STPNAME=$( echo $STPFILE | cut -d"." -f 1 );
		PREFILE=$( rev <<< "$STPFILE" | cut -d "." -f2 | rev )
		EXTE=$( rev <<< "$STPFILE" | cut -d "." -f1 | rev )
		mv $n "$( uuid ).$EXTE"
done

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.file.uuid "
#  echo "example:  ff.file.uuid  "
#fi
## TALON:
XeF


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


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.file.uuid "
#  echo "example:  ff.file.uuid  "
#fi
## TALON:
XeF


