#!/bin/bash

INPUT="$1"
if [ -z "$INPUT" ]
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi


ffmpeg \
-i "$INPUT" \
-map 0 \
-codec:v libx264 \
-codec:a libfdk_aac \
-f ssegment \
-segment_list out.list out%03d.ts < /dev/null


ffmpeg \
-i "$INPUT" \
-map 0 \
-codec:v libx264 \
-codec:a libfdk_aac \
-f ssegment \
-segment_list playlist.m3u8 \
-segment_list_flags +live \
-segment_time 10 out%03d.ts < /dev/null

exit 0

