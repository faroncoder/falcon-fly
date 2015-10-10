#!/bin/bash
startgreen=`date +%s`
GETDATE="$( date )"
YEAR="$( echo $GETDATE | awk '{print$6}' )"
DAY="$( echo $GETDATE | awk '{print$3}' )"
MONTH="$( echo $GETDATE | awk '{print$2}' )"
TIME="$( echo $GETDATE | awk '{print$4}' )"
NOW="$MONTH-$DAY-$YEAR @ $TIME"
mypath="$(readlink -f "$0")"
fileonly="$( basename $mypath )"
streamlog="/home/faron/var/streamings/encoding.log"


function tsizing {
            PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
            ffmpeg -i "$INPUT" -y -map 0 -c:v copy -bsf:v h264_mp4toannexb -c:a copy -copyts "$PREFILE.ts"  < /dev/null
            echo "$NOW :: $fileonly :: $INPUT :: MP4 ---> TS" >> $streamlog
            MPEG2TransportStreamIndexer "$PREFILE.ts" < /dev/null
            echo "$NOW :: $fileonly :: $INPUT :: TS ---> TSX" >> $streamlog
            testMPEG2TransportStreamTrickPlay "$PREFILE.ts" 0 1 "$PREFILE-out.ts" < /dev/null
            echo "$NOW :: $fileonly :: $INPUT :: OUTPUT TS ---> TSX" >> $streamlog
            MPEG2TransportStreamIndexer "$PREFILE-out.ts" < /dev/null
            echo "$NOW :: $fileonly :: $INPUT <--- task completed" >> $streamlog
}

## IF NO ARG GIVEN THEN WILL DO BATCH FILES IN FOLDER
if [ -z "$1" ]
    then
    $INPUT="$PWD/$line"
    echo -n "proceed with batch files processing? "
    read ACKLW

    if [ "$ACKLW"=="y" ]
        then
        > listing.txt
        ls -p *.mp4 >> listing.txt
        while read line
            do
                INPUT="$PWD/$line"
                tsizing
            done < listing.txt
        else
            echo "terminating..."
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
    fi
else
    INPUT="$1"
    tsizing
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
fi

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
