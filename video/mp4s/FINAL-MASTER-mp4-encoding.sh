#!/bin/bash
startgreen=`date +%s`
FILEGRAB="$(  find ./input -maxdepth 1 -type f  -name '*.mkv' | sort | head -n1 )"
INPUT="$( basename $FILEGRAB )"

if [ -z "$INPUT" ];
    then
        echo "Nope there is no file"
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
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
-codec:v libx264 \
-preset "$PRESET" \
-maxrate "$MAXRAT" \
-bufsize "$BUFRAT" \
-crf 23 \
-g 60 \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT,format=yuv420p" \
-movflags +faststart \
-pix_fmt yuv420p \
-pass 1 \
-f mp4 "output/$PREFILE.mp4" < /dev/null &&
ffmpeg -i "$INPUT" -y \
-codec:v libx264 \
-preset "$PRESET" \
-maxrate "$MAXRAT" \
-bufsize "$BUFRAT" \
-crf 23 \
-g 60 \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT,format=yuv420p" \
-movflags +faststart \
-pix_fmt yuv420p \
-pass 2 \
-codec:a libfdk_aac \
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
ffmpegthumbnailer -i "output/$PREFILE.mp4" -w -c png -s 0 -o "thumbs/$INPUT.png"

fi

./$0

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
