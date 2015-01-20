#!/bin/bash

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
-b:v 448k \
-qmin 0 \
-qmax 50 \
-maxrate 752k \
-bufsize 1504k \
-pass 1 \
-f webm "$FILE.webm" < /dev/null &&
ffmpeg \
-i "$INPUT" \
-y \
-c:v libvpx \
-b:v 448k \
-qmin 0 \
-qmax 50 \
-maxrate 752k \
-bufsize 1504k \
-c:a libvorbis \
-q:a 6 \
-b:a 128k \
-pass 2 \
-f webm \
-metadata title="" \
-metadata comment="Encoded by Faron the Falcon" \
-metadata artist="" "$FILE.webm" < /dev/null 


exit 0