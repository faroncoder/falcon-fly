#!/bin/bash

INPUT="$1"

if [ -z $INPUT ] 
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi	

PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
OUT="ORIG-$INPUT"
CHECKFILE="$( ls ORIG* )"


if [ -z "$CHECKFILE" ]
	then
		cp $INPUT $OUT
		FILE="$PREFILE"
		ffmpeg \
-i $INPUT \
-y \
-c:v libx264 \
-movflags +faststart \
-codec:a libfdk_aac \
-f mp4 \
-metadata title="" \
-metadata comment="Encoded by Faron the Falcon" \
-metadata artist="" "NEW-direct-x264-$FILE.mp4" < /dev/null
		rm $INPUT
	else
		FILE="$( echo $PREFILE | sed 's/ORIG-//g' )"
		ffmpeg \
-i $INPUT \
-y \
-c:v libx264 \
-movflags +faststart \
-codec:a libfdk_aac \
-f mp4 \
-metadata title="" \
-metadata comment="Encoded by Faron the Falcon" \
-metadata artist="" "NEW-direct-x264-$FILE.mp4" < /dev/null
fi

exit 0
