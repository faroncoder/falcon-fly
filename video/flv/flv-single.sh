#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

FILEGRAB="$1"
if [ -z "$FILEGRAB" ]
	then
	   echo -n "which movie file to convert for flv? "
	   read FILEGRAB
fi

NEWNAME="$( rev <<< "$FILEGRAB" | cut -d "." -f2 | rev )"
ffmpeg -i $FILEGRAB -y -vcodec libx264 -vprofile main -maxrate 1500k -bufsize 372k -pix_fmt yuv420p -vf "scale=trunc(oh*a/2)*2:240" -c:a libfdk_aac -b:a 128k -ac 2 -ar 44100 -f flv "$NEWNAME.flv"

#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] flv-single.sh  [ACTIVE] y

