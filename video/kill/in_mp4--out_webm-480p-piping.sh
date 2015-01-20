#!/bin/bash

#INPUT="$1"
#INPUT="$( find $PWD -maxdepth 1 -type f -name '*.mkv' ! -name '*.sh'| sort  | head -n1 )"
$INPUT="-"

if [ -z $INPUT ] 
	then
		echo "No more piping to be found for this operation to proceed..."
		exit 1
fi	

#BASENAME="$( basename $INPUT )"

##FILE="$( rev <<< "$BASENAME" | cut -d"." -f2 | rev )"

FILE="$( uuid )"

#TYPEFILE="480p"
TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
BITRAT="1072k"
MAXRAT="1616k"
BUFFRAT="3232k"
HEIGHTWT="480"
COMMENTFILE="Encoded by Faron the Falcon"

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
-pass 1 \
-f webm "$FILE.webm" < /dev/null &&
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
-c:a libvorbis \
-q:a 6 \
-b:a 128k \
-a:r 44000 \
-pass 2 \
-f webm \
-metadata title="$TITLEFILE" \
-metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE"  \
-metadata container="$CONTAINTERFILE" \
-metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE" \
"$FILE.webm" < /dev/null 

rm ffmpeg*
#mv "$INPUT" mp4/
./in_mp4--out_webm-480-piping.sh
exit 0