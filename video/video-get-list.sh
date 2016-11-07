#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
TARGETPATH="$1"
HEREPATH="$2"

if [ -z "$TARGETPATH" ]
    then
        echo -n "which type listing? (mkv/mp4/webm) "
        read  TARGETPATH
fi

if [ -z "$HEREPATH" ]
    then
        echo -n "which folder? "
        read  HEREPATH
fi

if  [ "$TARGETPATH"="mkv" -o "$TARGETPATH"="mp4" -o "$TARGETPATH"="webm"  ]
    then
    GETPATH="$HEREPATH/$TARGETPATH"
    HOSTHERE="$( hostname )"
    LIST="$PWD/$HOSTHERE-$TARGETPATH.dat"
    LIST2="$PWD/$HOSTHERE-$TARGETPATH.list"
    
        if [ ! "$( ls -p $GETPATH/*.$TARGETPATH )" ]
            then
                echo "$GETPATH is empty"
            else
                > $LIST2
		find $GETPATH -maxdepth 1 -type f -name "*.$TARGETPATH" -exec basename {} \; >> $LIST2
                echo "$HOSTHERE-$TARGETPATH listing completed"
        fi
	#while read line
	#	do
	#		FILESEND=$( basename $line )
	#		echo $FILESEND >> $LIST2
	#done < $LIST
#	rm $LIST
	echo "$HOSTHERE-$TARGETPATH.list is ready in $PWD"
fi
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] video-get-list.sh  [ACTIVE] y

