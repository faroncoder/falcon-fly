#!/bin/bash

INPUT="$1"
if [ -z "$INPUT" ]
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
else

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
PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
#FILE="mp4/$TYPEFILE-$PREFILE"

ffmpeg -i "$INPUT" -y \
-codec:v libvpx \
-maxrate "$MAXRAT" \
-bufsize "$BUFFRAT" \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
-b:v "$BITRAT" \
-quality good \
-movflags faststart \
-coder 1 \
-flags +loop \
-cmp chroma \
-partitions +parti4x4+partp8x8+partb8x8 \
-me_method hex \
-subq 6 \
-me_range 16 \
-g 250 \
-keyint_min 25 \
-sc_threshold 40 \
-i_qfactor 0.71 \
-b_strategy 1 \
-threads 0 \
-c:a libvorbis \
-qmin 10 \
-qmax 42 \
-q:a 6 \
-b:a 128k \
-ar 44100 \
-ac 2 \
-ab 128k \
-f webm \
-metadata title="$TITLEFILE" \
-metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE" \
-metadata container="$CONTAINTERFILE" \
-metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE"  \
"$PREFILE.webm" < /dev/null

#mv "$INPUT" finish/
#mv "$PREFILE.webm" webm/
#./mkving.sh < mkv-respond.txt
fi


exit 0
