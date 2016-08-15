#!/bin/bash
startgreen=`date +%s`

FILEIN="$1"
if [ -z "$FILEIN" ] 
	then
		echo "file name is needed (orginial file)"
		exit 1
else

FILE="$( rev <<< "NEW-$FILEIN" | cut -d"." -f2 | rev )"

NEWINTS="../$FILE.mp4"

mkdir \
-p $PWD/live555
cd live555
ln \
-s $NEWINTS in.mp4

		ffmpeg \
-i in.mp4 \
-y \
-c:v libx264 \
-bsf:v h264_mp4toannexb \
-c:a libfdk_aac \
-copyts in.ts  < /dev/null
		MPEG2TransportStreamIndexer in.ts < /dev/null
		testMPEG2TransportStreamTrickPlay in.ts 0 1 out.ts < /dev/null
		MPEG2TransportStreamIndexer out.ts < /dev/null

	fi
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

