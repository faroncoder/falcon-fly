#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN

if [[ $EUID == 0 ]]; then
	echo -e "$Fno sudo yourself out"
	XeF
else 
	GETFILE="$1"
	THISVERSION=730ebd32-d446-11e5-b1f0-7bf895f2366a
	ffmpegStart(){


	if [[ ! -d "$PWD/new-mp4" ]]; then
		mkdir "$PWD/new-mp4" -p 2> /dev/null;
	fi
	if [[ ! -d "$PWD/mediainfo" ]]; then
		mkdir "$PWD/mediainfo" -p 2> /dev/null;
	fi
	if [[ ! -d "$PWD/origs-trash" ]]; then
		mkdir "$PWD/origs-trash" -p 2> /dev/null;
	fi


	# configData

	#BUFRAT=`echo $(( 2 * $MAXRAT ))`  #SET VIDEO TO BE PARSABLE IN AHEAD PREBUFFERING BY SAME MAXRATE
	#PRESET=4  # 5=veryslow 4=slow 3=medium 2=fast 1=ultrafast

#	CRF="$CRFSET.0"
	# if [[ "$PRESET" == "1" ]]; then
	# 		PRESETx264="ultrafast"
	# 	fi
	# 	if [[ "$PRESET" == "2" ]]; then
	# 		PRESETx264="fast"
	# 	fi
	# 	if [[ "$PRESET" == "3" ]]; then
	# 		PRESETx264="medium"
	# 	fi
	# 	if [[ "$PRESET" == "4" ]]; then
	# 		PRESETx264="slow"
	# 	fi
	# 	if [[ "$PRESET" == "5" ]]; then
	# 		PRESETx264="veryslow"
	# 	fi
	# 	COND="-tune zerolatency -qp 0"
	# 	if [[ "$PRESET" == "5" ]] || [[ "$PRESET" == "1" ]]; then
	# 		CALCULATED="$PRESETx264 $COND"
	# 	else
	# 		CALCULATED="$PRESETx264"
	# 	fi
	# SEAF=$( uuid )

			} 

	# configData(){




	# # TITLEFILE=""
	# # YEARFILE=""
	# # ALBUMFILE=""
	# # CONTAINTERFILE=""
	# # ARTISTFILE=""
	# # COMMENTFILE=""
	# # ALBUMFILE="$THISVERSION"
	# # TITLEFILE="$NEWFILE "
	# # ARTISTFILE="Faron The Falcon"
	# # CODECVID="libx264"
	# # BITRAT=1372  ## 1500k for internet  1500k MINUS 128K TO DIVIDE BANDWIDTH FOR BOTH VIDEO AND AUDIO USE;
	# # MAXRAT=1372  ## DUH - WE DONT WANT MOVIE TO RUN BEYOND THE MAXRATE SO IT'D NOT CLOG NETWORK USED BY OTHER APPS
	# # CONTAINTERFILE="BIT=$BITRAT MAX=$MAXRAT BUF=$BUFRAT"
	# # HEIGHTWT=480
	# # CRFSET=23

	# }
	filePrep(){
	GETNAME=$( rev <<< $j | cut -d"." -f2 | rev )
	### name### 
	GETEXT=".$( rev <<< $j | cut -d"." -f1 | rev )"
	### .ext### 
	GETFILE="$PWD/$GETNAME$GETEXT"
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
	#### data  mediainfo converted ### 
		}
	fireUpTheEngine(){



		filePrep

		YEARFILE=`date`
		
		## GRAB OLD FILESIZE
		
		
	#	chmod 555 $INFOA
		#ffmpeg -r 25 -i $GETFILE -y -codec:v $CODECVID -preset $CALCULATED -maxrate "$( echo $MAXRAT)k" -bufsize "$( echo $BUFRAT)k" -b:v "$( echo $BITRAT)k" -crf $CRF -pix_fmt +yuv420p -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -coder 1 -flags +loop -flags +global_header -movflags +faststart -x264opts keyint=600:min-keyint=30:bframes=16 -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 -g 59.94 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -threads 0 -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k -f mp4 $FEED < /dev/null;
	


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
ffmpeg -i "$GETFILE" -y \
-codec:v libx264 \
-preset "slow" \
-maxrate "$MAXRAT$SMIL" \
-b:v "$MAXRAT$SMIL" \
-bufsize "$BUFRAT$SMIL" \
-g 60 \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT,format=yuv420p" \
-movflags +faststart \
-pix_fmt yuv420p \
-movflags +faststart \
-flags +global_header \
-pix_fmt yuv420p \
-crf 27 \
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
		

		# SIZEFILE=`ls $TRASH -lh | awk '{ print $5 }'`
		# ## GRAB NEW FILESIZE
		# KNFILE=`ls $NEWFILE -lh | awk '{ print $5 }'`
		# ## PACKING ALL INFO OF THE VIDEO INTO MEDIAINFO FOR EASY INDEXING
		# COMMENTFILE="PST=$PRESETx264 CRF=$CRFSET OLD=$SIZEFILE NEW=$KNFILE"


	ffmpeg -i "$FEED" -y -codec copy -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE" -f mp4  "$COLLECT"  < /dev/null;
#		chmod 555 $COLLECT
		

		rm $FEED
		mediainfo "$COLLECT" > "$INFOB"
#		chmod 555 $COLLECT	
		#QUERY="db.result.insert( {\"NAME\":\"$OUTPUT\",\"ORIG\":\"$INPUT\",\"JOB\":\"$SEAF\", \"EXECUTED\":\"$SEAF\", \"PST\":\"$PRESETx264\", \"CRF\":\"$CRFSET\", \"OLD_SIZE\":\"$SIZEFILE\", \"NEW_SIZE\":\"$KNFILE\", \"BIT\":\"$BITRAT\", \"BUF\":\"$BUFRAT\", \"MAX\":\"$MAXRAT\"} )"
		#echo $QUERY | mongo pornalive
	#	chmod 555 $INFOB

	}
GETFILES=$1
 if [[ $GETFILES == "" ]]; then
 	GETFILES=( `find $PWD -maxdepth 1 -type f -name '*.mp4' ! -name '*.sh' ` )
 fi
	ffmpegStart
	
	for j in "${GETFILE[@]}"; do 
	#	CHECKTHIS=`mediainfo $j | grep 'Format' | head -n 1 | awk '{ print $3 }'`; 
	#	if [[ $CHECKTHIS != "" ]]; then 
				fireUpTheEngine
	#	else 
	#			echo "" ## IF NO AS IF BLANK >> PROCEED ANYWAYS
	#	fi
	done
fi

################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred File needed $Foff=$Fyellow one or bulk files $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y



