#!/bin/bash

> listing.txt
ls -p *.mp4 >> listing.txt

while read line

PREFILE="$( rev <<< "$line" | cut -d"." -f2 | rev )"
INPUT="$PWD/$line"

    do
        /home/local/bin/ffmpeg -i "$INPUT" -map 0 -c:v copy -bsf:v h264_mp4toannexb -c:a copy -copyts "$PREFILE.ts"  < /dev/null

        /home/local/bin/MPEG2TransportStreamIndexer "$PREFILE.ts" < /dev/null
        /home/local/bin/testMPEG2TransportStreamTrickPlay "$PREFILE.ts" 0 1 "$PREFILE-out.ts" < /dev/null
        /home/local/bin/MPEG2TransportStreamIndexer "$PREFILE-out.ts" < /dev/null
        echo "ts-tsx-er-ing completed..."
    done < listing.txt

rm listing.txt

exit 0
