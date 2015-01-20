#!/bin/bash
TARGETPATH="$1"
if [ -z "$TARGETPATH" ]
    then
        echo -n "which type listing? (mkv/mp4/webm) "
        read  TARGETPATH
fi
if  [ "$TARGETPATH"=="mkv" -o "$TARGETPATH"=="mp4" -o "$TARGETPATH"=="webm"  ]
    then
    HEREPATH="/home/faron/streaming"
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
exit 0
