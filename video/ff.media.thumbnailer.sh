#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

<<<<<<< HEAD
# ## check if directory 'media' exists
# 	if [[ ! -d "$PWD/media" ]]; then 
# ## If not, make it
# 	    mkdir -p $PWD/media 2> /dev/null    
# 	fi


if [[ "$1" == "" ]]; then
	echo "${_no} filename? "
	XeF
else
## Variablize the input
	INPUT="$1"
	PREFILE=`echo $INPUT | rev | cut -d'.' -f2 | rev`
    PREEXT=`echo $INPUT | rev | cut -d'.' -f1 | rev`


	#if [[ ! -f "$PWD/thumbs/$INPUT" ]]; then
	if [[ ! -d "$PWD/thumbs" ]]; then
		echo "${_warn} directory 'thumbs' created"
	    mkdir -p "$PWD/thumbs" 2> /dev/null;
	fi
	ffmpeg -hide_banner -loglevel panic -ss 00:01:00.000 -i $INPUT -y -f image2 -vframes 1 $PWD/thumbs/$PREFILE.png < /dev/null
	echo "${_warn} $PREFILE.png thumbed"

	#else
## otherwise, if this file exists, then we are all happy.
	# 	COUNT=0
	# 	for m in "${GETFILES[@]}"; do
			
	# 		COUNT=`echo $(( $COUNT + 1 ))`
	# 	done
	# 	echo "${_stat} $COUNT thumbs created"
	# else
	# 		PREFILE="$( rev <<< "$INPUT" | cut -d "." -f2 | rev )"
	# 		ffmpeg -ss 00:01:00.000 -i $INPUT -y -f image2 -vframes 1 "$PWD/thumbs/$PREFILE.png" < /dev/null
	# 		echo "${_ok} $PREFILE.png --> thumbs/"
	#XeF
=======
INPUT="$1"


if [[ ! -d "$PWD/thumbs" ]]; then
        echo "${_warn} creating thumbs directory"
        mkdir -p "$PWD/thumbs"
fi

if [[ "$INPUT" == "" ]]; then
	#GETFILES=( ` find . -maxdepth 1 -type f -name '*.mp4' -exec basename {} \; ` )	
	echo "${_no} no file to media-thumbnail"
	exit 0
else
#	COUNT=0
#	for m in "${GETFILES[@]}"; do
		PREFILE="$( rev <<< "$INPUT" | cut -d "." -f2 | rev )"
		ffmpeg -ss 00:01:00.000 -i $INPUT -y -f image2 -vframes 1 "$PWD/thumbs/$PREFILE.png" < /dev/null
		echo "${_ok} $PREFILE.png thumbed"
#		COUNT=`echo $(( $COUNT + 1 ))`
#	done
#	echo "${_stat} $COUNT thumbs created"
#else
#		PREFILE="$( rev <<< "$INPUT" | cut -d "." -f2 | rev )"
#		ffmpeg -ss 00:01:00.000 -i $INPUT -y -f image2 -vframes 1 "$PWD/thumbs/$PREFILE.png" < /dev/null
#		echo "${_ok} $PREFILE.png --> thumbs/"
>>>>>>> 68abc402eb9935b362c9bf7374716bdfe4020a43
fi


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.media.thumbnailer.sh  [ACTIVE] y

