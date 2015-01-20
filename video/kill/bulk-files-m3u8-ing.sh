#!/bin/bash

INPUT="$1"
if [ -z" $INPUT" ]
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi

PREFILE="$( rev <<< "$line" | cut -d"." -f2 | rev )"
INPUT="$PWD/$line"

        ffmpeg \
        -i "$INPUT" \
        -map 0 \
        -codec:v copy \
        -codec:a copy \
        -f ssegment \
        -segment_list "$PREFILE".list "$PREFILE%03d.ts" < /dev/null


        ffmpeg \
        -i "$INPUT" \
        -map 0 \
        -codec:v copy \
        -codec:a copy \
        -f ssegment \
        -segment_list "$PREFILE.m3u8" \
        -segment_list_flags +live \
        -segment_time 10 "$PREFILE%03d.ts" < /dev/null

exit 0

