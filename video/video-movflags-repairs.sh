#!/bin/bash
FILEGRAB="$( find ./ -maxdepth 1 -type f  -name '*.mp4' ! -name '*.sh' | sort | head -n1 )"

YEAR="$( echo $GETDATE | awk '{print$6}' )"
DAY="$( echo $GETDATE | awk '{print$3}' )"
MONTH="$( echo $GETDATE | awk '{print$2}' )"
TIME="$( echo $GETDATE | awk '{print$4}' )"
NOW="$MONTH-$DAY-$YEAR @ $TIME"
mypath="$(readlink -f "$0")"
fileonly="$( basename $mypath )"
streamlog="/home/faron/var/streamings/encoding.log"
TYPEFILE="480p"
TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
BITRAT="1072k"
MAXRAT="1616k"
BUFFRAT="1616k"
HEIGHTWT="480"
COMMENTFILE="Encoded by Faron the Falcon"


if [ -z "$FILEGRAB" ]
    then

   echo "nope there is no file -- ending the encoding engine..."
    exit 0


    else

INPUT="$( basename $FILEGRAB )"
PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
        GETDATE="$( date )"
        echo "$NOW :: $fileonly :: $INPUT ---> encoding" >> $streamlog

## -analyzeduration 5000000 \
## -probesize 5000000 \

ffmpeg  \
-i "$INPUT" -y  \
-vcodec copy \
-acodec copy \
-pix_fmt yuv420p \
-movflags +empty_moov+separate_moof+frag_keyframe \
-f mp4 \
-metadata title="$TITLEFILE" \
-metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE" \
-metadata container="$CONTAINTERFILE" \
-metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE"  \
"$PREFILE-clean.mp4" < /dev/null

  #  GETDATE="$( date )"
 #   echo "$NOW :: $fileonly :: $INPUT  <--- completed" >> $streamlog
    mv $FILEGRAB old-mp4/
#    echo "$NOW :: $fileonly :: $INPUT ---> 'finish-mkv' folder" >> $streamlog
   mv "$PREFILE-clean.mp4" mp4/
  #  echo "$NOW :: $fileonly :: $PREFILE.mp4 ---> 'mp4' folder" >> $streamlog
fi
./cleanupmp4.sh

exit 0
