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

if [ ! -d /home/faron/.originals ]; then
	ln -s ~/home/faron/.falcon/originals ~/.originals
fi

FILE=$1
FILEB="$( basename $FILE )"
FILED="$( dirname $FILE )"
FILET="/tmp/$FILEB"
FILEO="/home/faron/.originals"

if [ ! "$1" ]; then 
	echo "No input. Aborting."
else
	cp "$FILE" "$FILET"
	chown faron:faron $FILET
	chmod 775 $FILET
	mv "$FILET" "$FILEO"
	sed -i -e '/#/d' $FILE
	sed -i -e '/^$/d' $FILE
	echo "$FILEB cleaned up."
fi

################### END
cd $HERE 2> /dev/null
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.comment.purge "
#  echo "example:  ff.comment.purge  "
#fi
## TALON:
XeF


