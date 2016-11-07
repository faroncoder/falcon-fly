#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

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
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] in_any--out_mkv.sh  [ACTIVE] y

