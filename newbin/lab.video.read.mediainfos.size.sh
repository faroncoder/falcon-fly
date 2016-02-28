#!/bin/bash
INPUT="$1"
MASTER="/media/clips/lib"


startScreening(){
	for a in "${INPUT[@]}"; do
			INPUT=$( basename $a )
			PREFILE=$( rev <<< $INPUT | cut -d"." -f2 | rev )
			EXT=$( rev <<< $INPUT | cut -d"." -f1 | rev )
			mediainfo $a >> "$PWD/data/$PREFILE.log"
done
}
exit 0

