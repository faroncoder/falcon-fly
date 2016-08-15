#!/bin/bash
export PATH=$PATH:/usr/local/bin
<<<<<<< HEAD
BINPULL=/home/users/faron/.falcon/scripts/htmls/VAULT
=======
<<<<<<< HEAD
BINPULL=/home/users/faron/.falcon/scripts/htmls/VAULT
=======
BINPULL=/mnt/falcon/scripts/htmls/VAULT
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
if [ ! -d "$PWD/jsc" ]; then
    tar -jxvf $BINPULL/video-jsc-pack.tar.bz2
fi
if [ ! -d "$PWD/jsc/videos" ]; then
    mkdir $PWD/jsc/videos/src -p
    mkdir $PWD/jsc/videos/cc -p
fi
if [ ! -d "$PWD/thumbs" ]; then
    ff.video.thumber
fi

GET=( ` find $PWD -maxdepth 1 -type f -name '*.mp4' ` )
for w in "${GET[@]}"; do
    FILENAME=$( basename $w )

    EXT=$( rev <<< "$FILENAME" | cut -d "." -f1 | rev )
    cp $BINPULL/video-backside-page.txt $PWD/tmp.txt
    sed -i -e "s/{PREFILE}/$PREFILE/g" $PWD/tmp.txt
    sed -i -e "s/{EXT}/$EXT/g" $PWD/tmp.txt
    mv $PWD/tmp.txt $PWD/jsc/videos/$PREFILE.html
    mv $w $PWD/jsc/videos/src/
    cp $BINPULL/video-frontside-page.txt $PWD/tmp.txt
    sed -i -e "s/{PREFILE}/$PREFILE/g" $PWD/tmp.txt
    mv $PWD/tmp.txt $PWD/$PREFILE.html
done

cp $BINPULL/video-index-page.txt $PWD/index.php

exit 0
