#!/bin/bash
startgreen=`date +%s`

INPUT="$1"

if [ -z $INPUT ] 
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi	

PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
OUT="ORIG-$INPUT"
CHECKFILE="$( ls ORIG* )"


if [ -z "$CHECKFILE" ]
	then
		cp $INPUT $OUT
		FILE="$PREFILE"
		ffmpeg \
-i $INPUT \
-y \
-c:v libx264 \
-movflags +faststart \
-codec:a libfdk_aac \
-f mp4 \
-metadata title="" \
-metadata comment="Encoded by Faron the Falcon" \
-metadata artist="" "NEW-direct-x264-$FILE.mp4" < /dev/null
		rm $INPUT
	else
		FILE="$( echo $PREFILE | sed 's/ORIG-//g' )"
		ffmpeg \
-i $INPUT \
-y \
-c:v libx264 \
-movflags +faststart \
-codec:a libfdk_aac \
-f mp4 \
-metadata title="" \
-metadata comment="Encoded by Faron the Falcon" \
-metadata artist="" "NEW-direct-x264-$FILE.mp4" < /dev/null
fi

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
