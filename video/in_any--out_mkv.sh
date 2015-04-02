#!/bin/bash

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
exit 0
