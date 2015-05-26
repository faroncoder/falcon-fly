#!/bin/bash
startgreen=`date`
FILEGRAB="$( find ./ -maxdepth 1 -type f  -name '*.mkv' ! -name '*.sh' | sort | head -n1 )"

YEAR="$( echo $GETDATE | awk '{print$6}' )"
DAY="$( echo $GETDATE | awk '{print$3}' )"
MONTH="$( echo $GETDATE | awk '{print$2}' )"
TIME="$( echo $GETDATE | awk '{print$4}' )"
NOW="$MONTH-$DAY-$YEAR @ $TIME"
mypath="$(readlink -f "$0")"
fileonly="$( basename $mypath )"
streamlog="/home/faron/var/streamings/encoding.log"
TYPEFILE="360p"
TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
BITRAT="550k"
MAXRAT="550k"
BUFFRAT="0k"
HEIGHTWT="360"
COMMENTFILE="Encoded by Faron the Falcon"


if [ -z "$FILEGRAB" ]
    then

   echo "nope there is no file -- ending the encoding engine..."
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0


    else

INPUT="$( basename $FILEGRAB )"
PREFILE="$( rev <<< "$INPUT" | cut -d "." -f2 | rev )"
        GETDATE="$( date )"
        echo "$NOW :: $fileonly :: $INPUT ---> encoding" >> $streamlog

ffmpeg -i "$INPUT" -y  \
-vcodec libx264 \
-preset fast \
-pix_fmt yuv420p \
-b:v "$BITRAT" \
-maxrate "$MAXRAT" \
-bufsize "$BUFFRAT" \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
-crf 23.0 \
-acodec libfdk_aac \
-coder 1 \
-flags +loop \
-cmp chroma \
-partitions +parti4x4+partp8x8+partb8x8 \
-me_method hex \
-subq 6 \
-me_range 16 \
-g 59.94 \
-keyint_min 25 \
-sc_threshold 40 \
-i_qfactor 0.71 \
-b_strategy 1 \
-threads 0 \
-movflags +faststart \
-ar 44100 \
-ac 2 \
-ab 128k \
-f mp4 \
-metadata title="$TITLEFILE" \
-metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE" \
-metadata container="$CONTAINTERFILE" \
-metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE"  \
"$PREFILE.mp4" < /dev/null

    GETDATE="$( date )"
    echo "$NOW :: $fileonly :: $INPUT  <--- completed" >> $streamlog
    mv $INPUT finish-mkv/
    echo "$NOW :: $fileonly :: $INPUT ---> 'finish-mkv' folder" >> $streamlog
    mv "$PREFILE.mp4" mp4/
    echo "$NOW :: $fileonly :: $PREFILE.mp4 ---> 'mp4' folder" >> $streamlog
fi
./$0

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
