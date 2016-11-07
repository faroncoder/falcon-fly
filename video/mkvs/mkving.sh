#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

 #/home/users/$USER/var/streamings/files/raw
source /usr/local/bin/file-name-cleaner
findMKV=( ls *.mkv )
for cc in "${findMKV[@]}";
	do mv $cc mkv/;
done

## function to collect all exisiting files in this directory only but one by one at a time

grabavi= source /usr/bin//find  $PWD -maxdepth 1 -type f  -name '*.avi' ! -name '*.mkv'  ! -name '*.sh'  ! -name '*.txt' -exe source /usr/bin//basename {} \;  )

for INPUTZ in "${grabavi[@]}";
	do
		INPUT="_stat source /usr/bin//basename $INPUTZ )";
		PREFILE="_stat source /usr/bin//rev <<< "$INPUT"  source /usr/bin//cut -d"." -f2  source /usr/bin//rev )";
		source /usr/bin//avidemux "$INPUT" --save
		read respondAvidemux
		echo $respondAvidemux
		source /usr/bin//mkvmerge --output "mkv/$PREFILE.mkv" --language 0:eng --cues 0:all --default-track 0:no --compression 0:none --language 1:eng "$INPUT" --track-order 0:0,0:1  < /dev/null
		mv $INPUT old/
	done

for fs in "${grabavi[@]}";
	do
		mediafile="$( echo $fs | sed 's/.avi/-mediainfo.list/g' )";
		mkdir -p mediainfos;
		mediainfo $fs >> "mediainfos/$mediafile";
		#mv $mediafile mediainfos/;
	done


		#mv "$PREFILE.mkv" mkv/

#INPUTZ="$1"

# if [ -z "$INPUTZ" ]
# 	then
# 		#echo "INPUT name is needed (orginial file)"
# 		echo "no more file left"

# 		exit 1
# 	else


#TYPEFILE="FEED"
#TITLEFILE="", YEARFILE="", ALBUMFILE="", CONTAINTERFILE="", ARTISTFILE="", COMMENTFILE="Encoded by Faron the Falcon"


#FILE="$TYPEFILE-$PREFILE"
#OUT="ORIG-$INPUT"


#avidemux --force-alt-h264 --load "$INPUT" --audio-codec AC3 --audio-resample 44100 --audio-normalize --audio-bitrate 128 --external-ac3 --audio-map --audio-mono2stereo --video-codec x264 --video-conf cbr=10m --autoindex --force-b-frame  --force-smart --force-unpack  --rebuild-index --output-format MATROSKA  --save "$PREFILE.mkv" < /dev/null




### RESPONSE FROM OTHER FILE TO ANSWER THE QUESTION BY AVIDEMUX ##



#mv "$PREFILE.mkv" mkv/

#ffmpeg -i "$PREFILE.mkv" -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE" "$PREFILE.mkv" < /dev/null


# fi

#ffmpeg -i "$INPUT" -codec:v libx264 -codec:a copy -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE"  "$FILE.mkv" < /dev/null
#mv $INPUT $OUT
#rm ffmpeg*

#./in_mkv--out_mp4-480p.sh "$PREFILE.mkv"
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] mkving.sh  [ACTIVE] y

