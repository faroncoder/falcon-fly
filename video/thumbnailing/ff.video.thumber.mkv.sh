#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
## FILE & FOLDER ROUTINE CHECK

  if [ ! -d "$PWD/thumbs" ]; then
        mkdir -p $PWD/thumbs
fi

INPUT=( `find -L . -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; ` )
# if [ -z "$INPUT" ];
# 	then
# 		INPUT=( $( find $PWD -maxdepth 1 -type f -name '*.mp4' -exec basename {} \; ) )
# 	else
# 		INPUT="$1"
# fi

if [[ -z "${INPUT[@]}" ]]; then
		echo "nope there is no file -- ending the encoding engine..."
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.video.thumber.mkv.sh  [ACTIVE] y

