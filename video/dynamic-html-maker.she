#!/bin/bash
startgreen=`date`

echo "run this in root su"

echo -n "location of video htmls folder? "
read VIDEOLOC
echo -n "location of video clips (full path)? "
read VIDEOCLIPS
echo -n "name of php name for html? "
read NAMEVIDEO

NAMEFOLDER="$( basename $VIDEOCLIPS )"

if [ ! -d "$PWD/$VIDEOLOC" ]; then
    mkdir "$PWD/$VIDEOLOC"
fi

if [ ! -d "$PWD/$VIDEOLOC/$NAMEFOLDER" ]; then
    ln -s "$( ln -s $VIDEOCLIPS $PWD/$VIDEOLOC/$NAMEFOLDER  )"
fi
> a.list
find -maxdepth 1 -type f -name '*.mp4' >> a.list
#ls $VIDEOLOC/$NAMEFOLDER/*.mp4 >> a.list
while read line;
    do
        FILENAME="$( basename $line )"
        PREFILE="$( rev <<< "$FILENAME" | cut -d "." -f2 | rev )"
        FILELOC="$VIDEOLOC/$PREFILE.html"
        cp templatevideo.txt $FILELOC
        sed -i -e "s/~_PATH_~/$NAMEFOLDER\/$PREFILE/g" $FILELOC
    done < a.list
    cp templatedynamic.txt "$NAMEVIDEO.php"
    sed -i -e "s/~_PATHa_~/$VIDEOLOC\/$NAMEFOLDER/g" "$NAMEVIDEO.php"
    sed -i -e "s/~_PATHb_~/$VIDEOLOC/g" "$NAMEVIDEO.php"
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
