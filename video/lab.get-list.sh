#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
TARGETPATH="$1"
if [ -z "$TARGETPATH" ]
    then
        echo -n "which type listing? (mkv/mp4/webm) "
        read  TARGETPATH
fi
if  [ "$TARGETPATH"=="mkv" -o "$TARGETPATH"=="mp4" -o "$TARGETPATH"=="webm"  ]
    then
    HEREPATH="/home/users/$USER/streaming"
    GETPATH="$HEREPATH/$TARGETPATH"
    HOSTHERE="$( hostname )"
    LIST="$HEREPATH/$HOSTHERE-$TARGETPATH.list"
    GETLISTING="$( ls $GETPATH/*$TARGETPATH )"
        if [ ! "$( ls -p $GETPATH/*.$TARGETPATH )" ]
            then
                echo "$GETPATH is empty"
            else
                > $LIST
                ls -p $GETPATH/*.$TARGETPATH >> $LIST
                echo "$TARGETPATH listing completed"
        fi
fi
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.get-list.sh  [ACTIVE] y

