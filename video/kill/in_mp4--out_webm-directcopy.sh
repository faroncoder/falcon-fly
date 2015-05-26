#!/bin/bash
startgreen=`date +%s`

INPUT="$1"
if [ -z $INPUT ] 
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi	

FILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"

ffmpeg \
-i "$INPUT" \
-y \
-c:v libvpx \
-qmin 0 \
-qmax 50 \
-pass 1 \
-f webm "$FILE.webm" < /dev/null &&
ffmpeg \
-i "$INPUT" \
-y \
-c:v libvpx \
-qmin 0 \
-qmax 50 \
-c:a libvorbis \
-q:a 6 \
-b:a 128k \
-pass 2 \
-f webm \
-metadata title="" \
-metadata comment="Encoded by Faron the Falcon" \
-metadata artist="" "$FILE.webm" < /dev/null 

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

