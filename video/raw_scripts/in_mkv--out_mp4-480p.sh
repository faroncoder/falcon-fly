#!/bin/bash
startgreen=`date`

INPUT="$1"
if [ -z "$INPUT" ]
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi

TYPEFILE="480p"
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
PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
#FILE="mp4/$TYPEFILE-$PREFILE"

ffmpeg -i "$INPUT" -y  \
-codec:v libx264 \
-profile:v high \
-b:v "$BITRAT" \
-maxrate "$MAXRAT" \
-bufsize "$BUFFRAT" \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
-pass 1 \
-an \
-f mp4 "$PREFILE.mp4" < /dev/null &&
ffmpeg \
-i "$INPUT"  -y \
-codec:v libx264 \
-profile:v high \
-b:v "$BITRAT"  \
-maxrate "$MAXRAT" \
-bufsize "$BUFFRAT" \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
-movflags +faststart+empty_moov+separate_moof+frag_keyframe \
-pass 2 \
-codec:a libfdk_aac \
-b:a 128k \
-ar 44100 \
-f mp4 \
-metadata title="$TITLEFILE" \
-metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE" \
-metadata container="$CONTAINTERFILE" \
-metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE"  \
"$PREFILE.mp4" < /dev/null 
rm ffmpeg*
#mv "$INPUT" mkv/
mv "$PREFILE.mp4" mp4/

./in_mkv--out_webm-480p.sh "$PREFILE.mkv"

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
