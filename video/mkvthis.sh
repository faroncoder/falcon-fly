#!/bin/bash
## function to collect all exisiting files in this directory only but one by one at a time
#INPUTZ="$(  find $PWD -maxdepth 1 -type f  ! -name '*.mkv'  ! -name '*.sh'  ! -name '*.txt' | head -n1 )"

#INPUTZ="$1"

#if [ -z "$INPUTZ" ]
#	then
##		#echo "INPUT name is needed (orginial file)"
#		echo "no more file left"
#
#		exit 1
##	else
#		INPUT="$( basename $INPUTZ )"
#		PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
#
#TYPEFILE="FEED"
#TITLEFILE="", YEARFILE="", ALBUMFILE="", CONTAINTERFILE="", ARTISTFILE="", COMMENTFILE="Encoded by Faron the Falcon"


#FILE="$TYPEFILE-$PREFILE"
#OUT="ORIG-$INPUT"


#avidemux --force-alt-h264 --load "$INPUT" --audio-codec AC3 --audio-resample 44100 --audio-normalize --audio-bitrate 128 --external-ac3 --audio-map --audio-mono2stereo --video-codec x264 --video-conf cbr=10m --autoindex --force-b-frame  --force-smart --force-unpack  --rebuild-index --output-format MATROSKA  --save "$PREFILE.mkv" < /dev/null

#avidemux "$INPUT" --save
# echo -n "which extension file you want to process? (mp4,avi,etc) ?"
# read grabcallsheet
# echo $grabcallsheet

INPUT="$( find . -maxdepth 1 -type f -name '*.mkv' | sort | head -n 1 )"

if [[ -z "$INPUT" ]]; then
	echo "no more files!"
	exit 0
else
	/usr/bin/avidemux2_cli "$INPUT" --rebuild-index  --audio-map  --video-map --output-format MATROSKA --save "output/$INPUT.mkv"
#read respondAvidemux
#echo $respondAvidemux
mv $INPUT completed/
fi
# ALLFILES=( * )

# for m in "${ALLFILES[@]}"
# 	do
# 	respondAvidemux=""
# 	avidemux2_cli --load "$PWD/$m" --save "$PWD/output/$m.mkv" --output-format MATROSKA --quit
# 	read respondAvidemux
# 	echo $respondAvidemux
# 	mv "$m" "$PWD/completed/"
# 	respondAvidemux=""

# done


# ### RESPONSE FROM OTHER FILE TO ANSWER THE QUESTION BY AVIDEMUX ##

# #mkvmerge --output "$PREFILE.mkv" --language 0:eng --cues 0:all --default-track 0:no --compression 0:none --language 1:eng "$INPUT" --track-order 0:0,0:1  < /dev/null

#mv $INPUT origs/
#mv "$PREFILE.mkv" mkv/

#ffmpeg -i "$PREFILE.mkv" -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE" "$PREFILE.mkv" < /dev/null


#fi

#ffmpeg -i "$INPUT" -codec:v libx264 -codec:a copy -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE"  "$FILE.mkv" < /dev/null
#mv $INPUT $OUT
#rm ffmpeg*

#./in_mkv--out_mp4-480p.sh "$PREFILE.mkv"

$0 < mkv-response.txt
exit 0
