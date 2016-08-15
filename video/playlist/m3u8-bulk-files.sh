#!/bin/bash
startgreen=`date +%s`

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
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
