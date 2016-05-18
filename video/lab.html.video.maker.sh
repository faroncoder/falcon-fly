#!/bin/bash

if [ ! -d "$PWD/jsc/videos" ]; then
    mkdir $PWD/jsc/videos -p
fi

if [ ! -d "$PWD/jsc/videos/src" ]; then
    mkdir $PWD/jsc/videos/src -p
fi
BINPULL=/mnt/falcon/scripts/htmls/VAULT


GET=( `find $PWD -maxdepth 1 -type f -name '*.mp4'  ` )
for w in "${GET[@]}"; do
    echo $w
    # FILENAME=$( basename $w )
    # PREFILE=$( rev <<< "$FILENAME" | cut -d "." -f2 | rev )
    # EXT=$( rev <<< "$FILENAME" | cut -d "." -f1 | rev )
    # PROCESS=$( cat $BINPULL/video-backside-page.txt | sed "s/{PREFILE}/$PREFILE/g" )
    # PROCESS2=$( echo $PROCESS | sed "s/{EXT}/$EXT/g" )
    # echo -e $PROCESS2 > $PWD/jsc/videos/$PREFILE.html
    # mv $w $PWD/jsc/videos/src/
done
exit 0
