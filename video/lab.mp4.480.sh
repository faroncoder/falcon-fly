#!/bin/bash
startgreen=`date +%s`

INPUT="$1"
if [ -z $INPUT ]
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi

TYPEFILE="720p"
TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
BITRAT="1904k"
MAXRAT="3088k"
BUFFRAT="6176k"
HEIGHTWT="480"
COMMENTFILE="Encoded by Faron the Falcon"
PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
FILE="$TYPEFILE-$PREFILE"

ffmpeg -i "$INPUT" -y -codec:v libx264 -profile:v high -b:v "$BITRAT" -maxrate "$MAXRAT" -bufsize "$BUFFRAT" -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -pass 1 -an -f mp4 "out.mp4" < /dev/null &&
ffmpeg -i "$INPUT" -y -codec:v libx264 -profile:v high -b:v "$BITRAT" -maxrate "$MAXRAT" -bufsize "$BUFFRAT" -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -movflags +faststart -pass 2 -codec:a libfdk_aac -b:a 128k -ar 44100 -f mp4 -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE"  "$FILE.mp4" < /dev/null

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
