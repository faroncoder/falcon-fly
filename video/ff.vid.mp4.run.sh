#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN
cd "$HOME/Raws" 1> /dev/null 2> /dev/null

if [[ $EUID == 0 ]]; then
	echo -e "$Fno sudo yourself out"
	XeF
fi

CHECK="$@"

if [[  "$CHECK" == "" ]]; then
	GOLP=( `find . -maxdepth 1 -type f -exec basename {} \; | sed '/.sh/d' | sed '/.ts/d' | sed '/.mov/d'` )
else
	GOLP=$CHECK
fi

THISVERSION="15ebc8d6-9c26-11e6-82a1-4305264aedd3:Oct272016"
OLDVER=( 730ebd32-d446-11e5-b1f0-7bf895f2366a )
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
	### current file$Foff###
	NEWNAME=`echo $GETNAME | tr '.' '-'`
	### new name###
	NEWFILE="$NEWNAME.mp4"
	### new file name###
	TRASH="$PWD/origs-trash/$GETNAME$GETEXT"
	### file to be trashed###
	COLLECT="$PWD/new-mp4/$NEWFILE"
	### converted file###
	FEED="$PWD/$NEWNAME-feed.dat"
	#### data -feed###
	INFOA="$PWD/mediainfo/$NEWNAME-original.info"
	#### data  mediainfo original ###
	INFOB="$PWD/mediainfo/$NEWNAME-converted.info"
	#### data  mediainfo converted ##
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
	PRESET="veryslow"
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
	mv $GETFILE $TRASH
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
echo "$Finfo $ALLFILES files queued"
for j in "${GOLP[@]}"; do
			CHECK=`find $( printf "/home/users/$USER" ) -maxdepth  2 -type f -name 'ffmpeg-stop' `
			if [[ -f "$CHECK" ]]; then
				rm $CHECK
				echo "$Fwarn FFMPEG engine stopped. $COUNT files completed."
				exit 1
			else
				rm "*-feed.dat" 2> /dev/null
				COUNT=`echo $(( $COUNT + 1 ))`
				start=`date +%s`
				echo -n "$Finfo $j ==> "
				filePrep
				fireUpTheEngine
				end=`date +%s`
				GETTIME=`echo $(( $end - $start ))`
				OUTTIME=`ff.handle.timecount $GETTIME`
				echo " $Fok [$Fyellow$COUNT$Foff of $Fred$ALLFILES$Foff completed in $Fteal$OUTTIME$Foff ]"
			fi
done

################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred File needed $Foff=$Fyellow one or bulk files $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y



