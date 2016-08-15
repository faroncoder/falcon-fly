#!/bin/bash
FILEGET=$1
if [ ! -d "mp4" ]; then
	mkdir "mp4" -p 2> /dev/null
fi
if [ ! -d "mkv-done" ]; then
	mkdir "mkv-done" -p 2> /dev/null
fi

if [ ! "$FILEGET" ]; then
	FILEGRAB=( $( find . -maxdepth 1 -type f  -name '*.*' ! -name '*.sh' -exec basename {} \; ) )
else
	FILEGRAB=$FILEGET
fi

CODECVID="libx264"
BITRAT=1372
MAXRAT=1372
BUFRAT=$BITRAT
PRESET=2
HEIGHTWT=480
#CHECKHOST=$( hostname --short )
# if [[ "$CHECKHOST" = 'f6' ]]; then
# 	CODECAUDIO="libfdk_aac"
# elif [[ "$CHECKHOST" = 'f7'  ]]; then
# 	CODECAUDIO="libmp3lame"
# else
# 	CODECAUDIO="libfdk_aac"
# fi

CRFSET=25
CRF="$CRFSET.0"

	if [[ "$PRESET" == "1" ]]; then
		PRESETx264="ultrafast"
	fi
	if [[ "$PRESET" == "2" ]]; then
		PRESETx264="fast"
	fi
	if [[ "$PRESET" == "3" ]]; then
		PRESETx264="medium"
	fi
	if [[ "$PRESET" == "4" ]]; then
		PRESETx264="veryslow"
	fi
	COND="-tune zerolatency -qp 0"
	if [[ "$PRESET" == "4" ]] || [[ "$PRESET" == "1" ]]; then
		CALCULATED="$PRESETx264 $COND"
	else
		CALCULATED="$PRESETx264"
	fi
TITLEFILE=""
YEARFILE="$( date )"
ALBUMFILE=""
CONTAINTERFILE="QT/FFMPEG"
ARTISTFILE="Faron Falcon"
COMMENTFILE="$PRESETx264 @ $CRFSET  | b:v $BITRAT kb | maxrate: $MAXRAT kb | buffsize: $BUFRAT kb"

startFFMPEG() {
	for x in "${FILEGRAB[@]}"; do
		STEPFULL=$( rev <<< $x | cut -d"." -f2 | rev )
		STEPNAME=$( rev <<< $STEPFULL | cut -d"_" -f2 | rev )
		STEPNUM=$( find . -maxdepth 1 -type f -name "*$STEPNAME*" | wc -l )
			if [[ ! "$STEPNUM" ]]; then
				SEQ=$( seq -w 0 0 | tail -n 1 )
			else
				SEQ=$( seq -w 0 `echo $(( $STEPNUM + 1 ))` | tail -n 1 )
			fi
	        	ffmpeg -i $x -y -codec:v $CODECVID -preset $CALCULATED -maxrate "$( echo $MAXRAT)k" -bufsize "$( echo $BUFRAT)k" -b:v "$( echo $BITRAT)k" -crf $CRF -pix_fmt +yuv420p -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -coder 1 -flags +loop -flags +global_header -movflags +faststart -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 -g 59.94 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -threads 0 -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k -f mp4 -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE"  "mp4/$STEPNAME-$SEQ.mp4" < /dev/null
	        		rename 's/-/_/g' "mp4/$STEPNAME-$SEQ.mp4"
	        		mv $x "mkv-done/" 2> /dev/null
	        done
}
        startFFMPEG
exit 0
