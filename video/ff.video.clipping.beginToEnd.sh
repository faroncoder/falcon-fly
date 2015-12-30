#!/bin/bash
if [ ! "$( echo $PATH | grep '/home/faron/.bin/' )" ]; then
	export PATH=$PATH:/home/faron/.bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

PREFILE="$( rev <<< $1 | cut -d "." -f2 | rev )"
EXT="$( rev <<< $1 | cut -d "." -f1 | rev )"
START=$2
END=$3


if [[ ! "$1" ]]; then
	echo "exiting -- you need filename to use this script."
	exit 1
else

        if [[ ! "$2" ]]; then
        	echo "starting time (format: 00:00:00) ? "
        	read START
        else
        	exit 2
        fi
        if [[ ! "$3" ]]; then
        	echo "end time (in minutes from $START) ?"
        	read END
        else
        	exit 3
        fi
fi

ffmpeg -i "$1" -y -ss "$START"  -to "$END" -c:v copy -c:a copy "$PREFILE-clipped.$EXT" < /dev/null

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.video.screenshot.1min "
#  echo "example:  ff.video.screenshot.1min  "
#fi
## TALON:
XeF


