#!/bin/bash
startgreen=`date +%s`

#cd /home/users/$USER/var/streamings/files/raw
#/mnt/falcon/scripts/.bin/file-name-cleaner.sh
/usr/local/bin/.bin/file-name-cleaner
mv *.mkv mkv/

## function to collect all exisiting files in this directory only but one by one at a time

INPUTZ="$(  /usr/bin//find  . -maxdepth 1 -type f  -name '*.avi' ! -name '*.mkv'  ! -name '*.sh'  ! -name '*.txt' | head -n 1 )"

#INPUTZ="$1"

if [ -z "$INPUTZ" ]
	then
		#echo "INPUT name is needed (orginial file)"
		echo "no more file left"
		exit 1
	else
		INPUT="$( /usr/bin//basename $INPUTZ )"
		PREFILE="$( /usr/bin//rev <<< "$INPUT" | /usr/bin//cut -d"." -f2 | /usr/bin//rev )"
		mediainfo $INPUT >> "mediainfos/raw-$PREFILE.list"
#TYPEFILE="FEED"
#TITLEFILE="", YEARFILE="", ALBUMFILE="", CONTAINTERFILE="", ARTISTFILE="", COMMENTFILE="Encoded by Faron the Falcon"


#FILE="$TYPEFILE-$PREFILE"
#OUT="ORIG-$INPUT"


#avidemux --force-alt-h264 --load "$INPUT" --audio-codec AC3 --audio-resample 44100 --audio-normalize --audio-bitrate 128 --external-ac3 --audio-map --audio-mono2stereo --video-codec x264 --video-conf cbr=10m --autoindex --force-b-frame  --force-smart --force-unpack  --rebuild-index --output-format MATROSKA  --save "$PREFILE.mkv" < /dev/null

/usr/bin//avidemux "$INPUT" --rebuild-index  --audio-map  --video-map --output-format MATROSKA  --save
read respondAvidemux
echo $respondAvidemux


### RESPONSE FROM OTHER FILE TO ANSWER THE QUESTION BY AVIDEMUX ##

/usr/bin//mkvmerge --output "$PREFILE.mkv" --language 0:eng --cues 0:all --default-track 0:no --compression 0:none --language 1:eng "$INPUT" --track-order 0:0,0:1  < /dev/null

mv "$INPUT" old/
mediainfo "$PREFILE.mkv" >> "mediainfos/mkv-$PREFILE.list"
mv "$PREFILE.mkv" mkv/
#mv "$PREFILE.mkv" mkv/

#ffmpeg -i "$PREFILE.mkv" -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE" "$PREFILE.mkv" < /dev/null


fi

#ffmpeg -i "$INPUT" -codec:v libx264 -codec:a copy -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE"  "$FILE.mkv" < /dev/null
#mv $INPUT $OUT
#rm ffmpeg*

#./in_mkv--out_mp4-480p.sh "$PREFILE.mkv"
startmkv

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
