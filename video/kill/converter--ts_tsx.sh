#!/bin/bash

> listing.txt
ls -p *.mp4 >> listing.txt

while read line

PREFILE="$( rev <<< "$line" | cut -d"." -f2 | rev )"
INPUT="$PWD/$line"

    do
        ffmpeg -i "$INPUT" -c:v copy -bsf:v h264_mp4toannexb -c:a copy -copyts "$PREFILE.ts"  < /dev/null
        MPEG2TransportStreamIndexer "$PREFILE.ts" < /dev/null
        testMPEG2TransportStreamTrickPlay "$PREFILE.ts" 0 1 "$PREFILE-out.ts" < /dev/null
        MPEG2TransportStreamIndexer "$PREFILE-out.ts" < /dev/null
        echo "ts-tsx-er-ing completed..."

if [ -z "$INPUT" ]
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi




exit 0

