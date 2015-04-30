#!/bin/bash

FILEGRAB="$1"
if [ -z "$FILEGRAB" ]
	then
	   echo -n "which movie file to convert for flv? "
	   read FILEGRAB
fi

NEWNAME="$( rev <<< "$FILEGRAB" | cut -d "." -f2 | rev )"
ffmpeg -i $FILEGRAB -y -vcodec libx264 -vprofile main -maxrate 1500k -bufsize 372k -pix_fmt yuv420p -vf "scale=trunc(oh*a/2)*2:240" -c:a libfdk_aac -b:a 128k -ac 2 -ar 44100 -f flv "$NEWNAME.flv"

exit 0
