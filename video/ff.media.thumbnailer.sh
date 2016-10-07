#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;

#################### BEGIN

INPUT="$1"


if [[ ! -d "$PWD/thumbs" ]]; then
        echo "$Fwarn creating thumbs directory"
        mkdir -p "$PWD/thumbs"
fi

if [[ "$INPUT" == "" ]]; then
	#GETFILES=( ` find . -maxdepth 1 -type f -name '*.mp4' -exec basename {} \; ` )	
	echo "$Fno no file to media-thumbnail"
	exit 0
else
#	COUNT=0
#	for m in "${GETFILES[@]}"; do
		PREFILE="$( rev <<< "$INPUT" | cut -d "." -f2 | rev )"
		ffmpeg -ss 00:01:00.000 -i $INPUT -y -f image2 -vframes 1 "$PWD/thumbs/$PREFILE.png" < /dev/null
		echo "$Fok $PREFILE.png thumbed"
#		COUNT=`echo $(( $COUNT + 1 ))`
#	done
#	echo "$Fstat $COUNT thumbs created"
#else
#		PREFILE="$( rev <<< "$INPUT" | cut -d "." -f2 | rev )"
#		ffmpeg -ss 00:01:00.000 -i $INPUT -y -f image2 -vframes 1 "$PWD/thumbs/$PREFILE.png" < /dev/null
#		echo "$Fok $PREFILE.png --> thumbs/"
fi


################### END
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/video/ff.media.thumbnailer.sh [ACTIVE] y


