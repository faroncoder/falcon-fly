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

<<<<<<< HEAD
if [ ! -d /home/faron/.originals ]; then
	ln -s ~/home/faron/.falcon/originals ~/.originals
=======
if [ ! -d /home/users/$USER/.originals ]; then
	ln -s ~/mnt/falcon/originals ~/.originals
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
fi

FILE=$1
FILEB="$( basename $FILE )"
FILED="$( dirname $FILE )"
FILET="/tmp/$FILEB"
<<<<<<< HEAD
FILEO="/home/faron/.originals"
=======
FILEO="/home/users/$USER/.originals"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

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


