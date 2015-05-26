#!/bin/bash
startgreen=`date +%s`

#INPUT="$1"
INPUT="$( find $PWD -maxdepth 1 -type f -name '*.mkv' ! -name '*.mp4' ! -name '*.sh' | sort  | head -n1 )"

if [ -z $INPUT ] 
	then
		echo "No more file to be found for this operation to proceed..."
		exit 1
fi	

BASENAME="$( basename $INPUT )"

FILE="$( rev <<< "$BASENAME" | cut -d"." -f2 | rev )"

TYPEFILE="480p"
TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
COMMENTFILE="Encoded by Faron the Falcon"
ARTISTFILE=""
BITRAT="1072k"
MAXRAT="1616k"
BUFFRAT="3232k"
HEIGHTWT="480"


ffmpeg \
-i "$INPUT" \
-y \
-c:v libvpx \
-b:v "$BITRAT" \
-qmin 0 \
-qmax 50 \
-maxrate "$MAXRAT" \
-bufsize "$BUFFRAT" \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
-r 30 \
-c:a libvorbis \
-q:a 5 \
-b:a 128k \
-ar 44000 \
-f webm \
-metadata title="$TITLEFILE" \
-metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE"  \
-metadata container="$CONTAINTERFILE" \
-metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE" \
"$FILE.webm" < /dev/null 

rm ffmpeg*
mv "$INPUT" mp4/
./in_mp4--out_webm-480p.sh
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
