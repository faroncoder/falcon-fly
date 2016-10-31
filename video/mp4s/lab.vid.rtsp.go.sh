#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

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
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.vid.rtsp.go.sh  [ACTIVE] y

