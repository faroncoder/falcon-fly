#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/loader; startTime;
####################START
#cd /home/users/faron/Raws/ 1> /dev/null;

if [[ $EUID == 0 ]]; then
	echo -e "`_no` sudo yourself out"
	doneTime
fi


CHECK=( `echo $@` )

if [[  "${CHECK[@]}" == "" ]]; then
	GET=( `ls *.mp4` ); for n in "${GET[@]}"; do MD5=`md5sum $n | awk '{print $1}'`; FILE=`echo $n | sed 's/.mp4//g'`; rename "s/$FILE/$MD5/g" $n ; done
	GET=""
	GOLP=( `find . -maxdepth 1 -type f -exec basename {} \; | sed '/.sh/d' | sed '/ffmpeg-/d' |  sed '/.ts/d' | sed '/.mov/d'` )
else
	GOLP=( `echo ${CHECK[@]} ` )
fi

THISVERSION="15ebc8d6-9c26-11e6-82a1-4305264aedd3:Oct272016"
#OLDVER=( 730ebd32-d446-11e5-b1f0-7bf895f2366a )
if [[ ! -d "$PWD/new-mp4" ]]; then
	mkdir "$PWD/new-mp4" -p 2> /dev/null;
fi
if [[ ! -d "$PWD/mediainfo" ]]; then
	mkdir "$PWD/mediainfo" -p 2> /dev/null;
fi
if [[ ! -d "$PWD/origs-trash" ]]; then
	mkdir "$PWD/origs-trash" -p 2> /dev/null;
fi
filePrep(){
	GETNAME=$( rev <<< $j | cut -d"." -f2 | rev )
	### name###
	GETEXT=".$( rev <<< $j | cut -d"." -f1 | rev )"
	### .ext###
	#GETFILE="$PWD/$GETNAME$GETEXT"
	### current file$reset###
	NEWNAME=`echo $GETNAME | tr '.' '-'`
	### new name###
	NEWFILE="$NEWNAME.mp4"
	### new file name###
	TRASH="$PWD/origs-trash/$j"
	### file to be trashed###
	COLLECT="$PWD/new-mp4/$NEWFILE"
	### converted file###
	FEED="$PWD/feed-$j.mp4"
	#### data -feed###
	INFOA="$PWD/mediainfo/$NEWNAME.original.info"
	#### data  mediainfo original ###
	INFOB="$PWD/mediainfo/$NEWNAME.converted.info"
	#### data  mediainfo converted ##
#	NOTIFYSYS="$PWD/ffmpeg.on"
}
fireUpTheEngine(){
	YEARFILE=`date`
	HEIGHTWT="360"
	TITLEFILE=""
	YEARFILE=""
	ALBUMFILE=""
	CONTAINTERFILE=""
	SMIL="K"
	ARTISTFILE=""
	MAXRAT=""
	MAXRATE=""
	#BUFRAT="$MAXRAT"
	#BUFRAT=` echo $(( 2 * $MAXRAT  ))`
	PRESET="slow"
	COMMENTFILE="Encoded by Faron the Falcon"
	> $FEED
	#PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
	ffmpeg -loglevel quiet  -i $j -y -codec:v libx264 -preset "$PRESET" -g 60 -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -movflags +faststart -flags +global_header -pix_fmt yuv420p -crf 25.0  -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k   -f  mp4 $FEED < /dev/null
#	ffmpeg -loglevel quiet  -i $j -y -codec:v libx264 -preset "$PRESET" -maxrate "$MAXRATE" -b:v "$MAXRATE" -g 60 -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -movflags +faststart -flags +global_header -pix_fmt yuv420p -crf 25.0  -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k   -f  mp4 $FEED < /dev/null

#	ffmpeg -loglevel quiet  -i $j -y -codec:v libx264 -preset "$PRESET" -maxrate "$MAXRAT$SMIL" -b:v "$MAXRAT$SMIL" -bufsize "$BUFRAT$SMIL" -g 60 -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT,format=yuv420p" -movflags +faststart -flags +global_header -pix_fmt yuv420p -crf 25.0  -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k -f mp4 "$FEED" < /dev/null
	# 		ffmpeg f-i $GETFILE -y -codec:v $CODECVID -preset $CALCULATED -maxrate "$( echo $MAXRAT)k" \
	# -bufsize "$( echo $BUFRAT)k" -b:v "$( echo $BITRAT)k" -crf $CRF -pix_fmt +yuv420p \
	# -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -coder 1 -flags +loop \
	# -flags +global_header -movflags +faststart -x264opts keyint=600:min-keyint=30:bframes=16 \
	# -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 \
	# -g 59.94 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -threads 0 \
	# -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k -f mp4 "$FEED" < /dev/null;
	mv "$j" "$TRASH"
	mediainfo "$TRASH" > "$INFOA"
	ffmpeg -i "$FEED" -y -codec copy -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE"   "$COLLECT"  < /dev/null;
	mediainfo "$COLLECT" > "$INFOB"
}

COUNT=0
ALLFILES=`echo ${GOLP[@]} | wc -w`
_send=$CHR23; _comment="$b_yellow$ALLFILES$reset files queued"
_FG
> $PWD/ffmpeg-on


for j in "${GOLP[@]}"; do
				startTimeScript
				# rm "$PWD/*.dat" 2> /dev/null
				COUNT=`echo $(( $COUNT + 1 ))`
				_comment="$j ==> "
				_send=$CHR24;
				_FG
				filePrep
				fireUpTheEngine 2> /dev/null < /dev/null
				
				STIMED=`tellTimeScript`


				echo  -n "$STIMED  --   $j" >>  $PWD/ffmpeg-results
				_comment="$b_yellow$COUNT$reset of $b_red$ALLFILES$reset completed in $b_teal $STIMED $reset "
				_send=$CHR156
				_CMD=$( notify-send "Item done" )
				_ok 

				
				rm $FEED



done
###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.vid.mp4.run.sh  [ACTIVE] y

