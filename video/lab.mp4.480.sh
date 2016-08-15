#!/bin/bash
startgreen=`date +%s`

INPUT="$1"
if [ -z $INPUT ]
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi

TYPEFILE="720p"
TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
BITRAT="1904k"
MAXRAT="3088k"
BUFFRAT="6176k"
HEIGHTWT="480"
COMMENTFILE="Encoded by Faron the Falcon"
PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
FILE="$TYPEFILE-$PREFILE"

ffmpeg -i "$INPUT" -y -codec:v libx264 -profile:v high -b:v "$BITRAT" -maxrate "$MAXRAT" -bufsize "$BUFFRAT" -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -pass 1 -an -f mp4 "out.mp4" < /dev/null &&
ffmpeg -i "$INPUT" -y -codec:v libx264 -profile:v high -b:v "$BITRAT" -maxrate "$MAXRAT" -bufsize "$BUFFRAT" -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -movflags +faststart -pass 2 -codec:a libfdk_aac -b:a 128k -ar 44100 -f mp4 -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE"  "$FILE.mp4" < /dev/null

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
