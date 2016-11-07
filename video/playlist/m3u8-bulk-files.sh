#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

> listing.txt
ls -p *.mp4 >> listing.txt

while read line

PREFILE="$( rev <<< "$line" | cut -d"." -f2 | rev )"
INPUT="$PWD/$line"

    do
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

    done < listing.txt
rm listing.txt
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] m3u8-bulk-files.sh  [ACTIVE] y

