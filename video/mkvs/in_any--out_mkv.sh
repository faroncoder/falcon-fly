#!/bin/bash
startgreen=`date +%s`

INPUT="$1"
if [ -z $INPUT ] 
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi	


TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
COMMENTFILE="Encoded by Faron the Falcon"
PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
FILE="$PREFILE"
OUT="ORIG-$INPUT"

ffmpeg -i "$INPUT" -codec:v libx264 -codec:a copy -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE"  "$FILE.mkv" < /dev/null
mv $INPUT $OUT
rm ffmpeg*
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
