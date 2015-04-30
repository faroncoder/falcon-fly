#!/bin/bash
## FILE & FOLDER ROUTINE CHECK
  if [ ! -d "$PWD/output" ];
    then
  	mkdir -p $PWD/output/thumbs

fi
  if [ ! -d "$PWD/completed" ];
    then
  	mkdir -p $PWD/completed
fi

  if [ ! -d "$PWD/thumbs" ];
    then
        mkdir -p $PWD/thumbs
fi


function compileFfmpeg {

	TYPEFILE="360p"
	TITLEFILE=""
	YEARFILE=""
	ALBUMFILE=""
	CONTAINTERFILE=""
	ARTISTFILE=""
	MAXRAT="1024k"
	BUFFRAT="1024k"
	HEIGHTWT="360"
	COMMENTFILE="Encoded by Faron the Falcon"

	PREFILE="$( rev <<< "$INPUT" | cut -d "." -f2 | rev )"
		#GETDATE="$( date )"
		#  echo "$NOW :: $fileonly :: $INPUT ---> encoding" >> $streamlog

		ffmpeg -i "$INPUT" -y  \
		-vcodec libx264 \
		-preset veryfast \
		-pix_fmt yuv420p \
		-maxrate "$MAXRAT" \
		-bufsize "$BUFFRAT" \
		-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
		-crf 23.0 \
	        -acodec libfdk_aac \
		-coder 1 \
		-flags +loop \
		-cmp chroma \
		-partitions +parti4x4+partp8x8+partb8x8 \
		-me_method hex \
		-subq 6 \
		-me_range 16 \
		-g 60 \
		-keyint_min 25 \
		-sc_threshold 40 \
		-i_qfactor 0.71 \
		-b_strategy 1 \
		-threads 0 \
		-movflags +faststart \
		-ar 44100 \
		-ac 2 \
		-ab 128k \
		-f mp4 \
		-metadata title="$TITLEFILE" \
		-metadata album="$ALBUMFILE" \
		-metadata year="$YEARFILE" \
		-metadata container="$CONTAINTERFILE" \
		-metadata artist="$ARTISTFILE" \
		-metadata comment="$COMMENTFILE"  \
		"$PWD/$PREFILE.mp4" < /dev/null

		#    GETDATE="$( date )"
		#    echo "$NOW :: $fileonly :: $INPUT  <--- completed" >> $streamlog
		mv "$PWD/$INPUT" "$PWD/completed/"
		#    echo "$NOW :: $fileonly :: $INPUT ---> 'finish-mkv' folder" >> $streamlog

		#    echo "$NOW :: $fileonly :: $PREFILE.mp4 ---> 'mp4' folder" >> $streamlog
		#ffmpegthumbnailer -i "output/$PREFILE.mp4" -w -c png -s 0 -o "thumbs/$INPUT.png"
		ffmpeg -ss 00:01:00.000 -i "$PWD/$PREFILE.mp4" -y -f  image2 -vframes 1 "$PWD/thumbs/$PREFILE.png"  < /dev/null
		mv "$PWD/$PREFILE.mp4" "$PWD/output/"
}


INDVI="$1"
if [ -z "$INDVI" ]
	then
		FILEGRAB="$( find $PWD -maxdepth 1 -type f  ! -name '*.sh' ! -name 'mp4this' | sort | head -n 1 )"
		if [ -z "$FILEGRAB" ]
    			then
				echo "nope there is no file -- ending the encoding engine..."
				exit 0
			else
				INPUT=$( basename $FILEGRAB )
				compileFfmpeg
		fi
	else
		INPUT=$( basename $INDVI )
		compileFfmpeg
		exit 0
fi




# YEAR="$( echo $GETDATE | awk '{print$6}' )"
# DAY="$( echo $GETDATE | awk '{print$3}' )"
# MONTH="$( echo $GETDATE | awk '{print$2}' )"
# TIME="$( echo $GETDATE | awk '{print$4}' )"
# NOW="$MONTH-$DAY-$YEAR @ $TIME"
# mypath="$(readlink -f "$0")"
# fileonly="$( basename $mypath )"
# streamlog="/home/faron/var/streamings/encoding.log"



$0  ## self-execute the script again for reloop

exit 0
