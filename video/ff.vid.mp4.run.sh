#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
cd /home/users/faron/Raws/ 1> /dev/null;

if [[ $EUID == 0 ]]; then
	echo -e "${_no} sudo yourself out"
	XeF
fi

CHECK="$@"

if [[  "$CHECK" == "" ]]; then
	GOLP=( `find . -maxdepth 1 -type f -exec basename {} \; | sed '/.sh/d' | sed '/ffmpeg-/g' |  sed '/.ts/d' | sed '/.mov/d'` )
else
	GOLP=( $CHECK )
fi

THISVERSION="15ebc8d6-9c26-11e6-82a1-4305264aedd3:Oct272016"
#OLDVER=( 730ebd32-d446-11e5-b1f0-7bf895f2366a )
if [[ ! -d "$RAWHOME/new-mp4" ]]; then
	mkdir "$RAWHOME/new-mp4" -p 2> /dev/null;
fi
if [[ ! -d "$RAWHOME/mediainfo" ]]; then
	mkdir "$RAWHOME/mediainfo" -p 2> /dev/null;
fi
if [[ ! -d "$RAWHOME/origs-trash" ]]; then
	mkdir "$RAWHOME/origs-trash" -p 2> /dev/null;
fi
filePrep(){
	GETNAME=$( rev <<< $j | cut -d"." -f2 | rev )
	### name###
	GETEXT=".$( rev <<< $j | cut -d"." -f1 | rev )"
	### .ext###
	#GETFILE="$RAWHOME/$GETNAME$GETEXT"
	### current file$Foff###
	NEWNAME=`echo $GETNAME | tr '.' '-'`
	### new name###
	NEWFILE="$NEWNAME.mp4"
	### new file name###
	TRASH="$RAWHOME/origs-trash/$GETNAME$GETEXT"
	### file to be trashed###
	COLLECT="$RAWHOME/new-mp4/$NEWFILE"
	### converted file###
	FEED="$RAWHOME/$NEWNAME-feed.dat"
	#### data -feed###
	INFOA="$RAWHOME/mediainfo/$NEWNAME-original.info"
	#### data  mediainfo original ###
	INFOB="$RAWHOME/mediainfo/$NEWNAME-converted.info"
	#### data  mediainfo converted ##
	NOTIFYSYS="$RAWHOME/ffmpeg-on"
}
fireUpTheEngine(){
	YEARFILE=`date`
	HEIGHTWT="480"
	TITLEFILE=""
	YEARFILE=""
	ALBUMFILE=""
	CONTAINTERFILE=""
	SMIL="K"
	ARTISTFILE=""
	MAXRAT="1372"
	MAXRATE="$MAXRATE$SMIL"
	#BUFRAT="$MAXRAT"
	BUFRAT=` echo $(( 2 * $MAXRAT  ))`
	PRESET="slow"
	COMMENTFILE="Encoded by Faron the Falcon"

	#PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
	ffmpeg -loglevel panic -i "$j" -y \
	-codec:v libx264 \
	-preset "$PRESET" \
	-maxrate "$MAXRAT$SMIL" \
	-b:v "$MAXRAT$SMIL" \
	-bufsize "$BUFRAT$SMIL" \
	-g 60 \
	-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT,format=yuv420p" \
	-movflags +faststart \
	-flags +global_header \
	-pix_fmt yuv420p \
	-crf 25 \
	-codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k \
	-f mp4 "$FEED" < /dev/null
	# 		ffmpeg f-i $GETFILE -y -codec:v $CODECVID -preset $CALCULATED -maxrate "$( echo $MAXRAT)k" \
	# -bufsize "$( echo $BUFRAT)k" -b:v "$( echo $BITRAT)k" -crf $CRF -pix_fmt +yuv420p \
	# -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -coder 1 -flags +loop \
	# -flags +global_header -movflags +faststart -x264opts keyint=600:min-keyint=30:bframes=16 \
	# -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 \
	# -g 59.94 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -threads 0 \
	# -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k -f mp4 "$FEED" < /dev/null;
	mv "$GETFILE" "$TRASH/"
	mediainfo "$TRASH" > "$INFOA"
	ffmpeg -i "$FEED" -y -codec copy \
	-metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" \
	-metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" \
	-metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE" \
	-f mp4  "$COLLECT"  < /dev/null;
	rm $FEED
	mediainfo "$COLLECT" > "$INFOB"
}

COUNT=0
ALLFILES=`echo ${GOLP[@]} | wc -w`
_send=$CHR23; _comment="$b_yellow$ALLFILES$reset files queued"
_FG
touch "$NOTIFYSYS"




for j in "${GOLP[@]}"; do
				rm "$RAWHOME/*-feed.dat" 2> /dev/null
				COUNT=`echo $(( $COUNT + 1 ))`
				startTimeScript
				_comment="$j ==>"
				_send=$CHR24;
				_FY
				filePrep
				fireUpTheEngine
				STIMED=`tellTimeScript`
				echo  "$STIMED  --   $j" >>  $RAWHOME/ffmpeg-results
				_comment="$b_yellow$COUNT${reset} of $b_red$ALLFILES$reset completed in $b_teal $STIMED $reset "
				_send="$CHR23"
				rm $RAWHOME/*-feed.dat
				notify-send "Item done" "`_FG`"



done
###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.vid.mp4.run.sh  [ACTIVE] y

