#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

if [ ! -d /home/users/$USER/.originals ]; then
	ln -s ~/home/users/faron/.falcon/originals ~/.originals
fi

FILE=$1
FILEB="$( basename $FILE )"
FILED="$( dirname $FILE )"
FILET="/tmp/$FILEB"
FILEO="/home/users/$USER/.originals"

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
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.comment.purge.sh  [ACTIVE] y

