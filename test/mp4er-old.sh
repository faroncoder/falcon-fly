#!/bin/bash
startgreen=`date +%s`

FILEGRAB="$( find -maxdepth 1 -type f | sort | head -n1 )"
INPUT="$( basename $FILEGRAB )"

if [ -z "$INPUT" ];
    then
        echo "Nope there is no file"
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
    else
        echo "Yep there is a file"

HEIGHTWT="480"
TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
MAXRAT="1200k"
BUFRAT="$MAXRAT"
PRESET="veryslow"
COMMENTFILE="Encoded by Faron the Falcon"
PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
ffmpeg -i "$INPUT" -y \
-vcodec libx264 \
-preset "$PRESET" \
-maxrate "$MAXRAT" \
-bufsize "$BUFRAT" \
-crf 23 \
-g 60 \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
-movflags +faststart \
-acodec libfdk_aac \
-b:a 128k \
-ar 44100 \
-metadata title="$TITLEFILE" \
-metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE" \
-metadata container="$CONTAINTERFILE" \
-metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE" \
-f mp4 "output/$PREFILE.mp4" < /dev/null
mv $INPUT completed/
ffmpeg -i "output/$PREFILE.mp4" -y  -ss 00:00:10.435 -f  image2 -vframes 1 "$PREFILE.png"  < /dev/null
#convert "$PREFILE.png" -resize 256x256\> "thumbs/$PREFILE.png"
#rm "$PREFILE.png"
convert "$PREFILE.png" -resize "330x248^" -gravity center -background black -extent 330x248 "output/thumbs/$INPUT.png"  < /dev/null
#ffmpegthumbnailer -i "output/$PREFILE.mp4" -w -c png -s 0 -o "thumbs/$INPUT.png"
fi

./$0

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
