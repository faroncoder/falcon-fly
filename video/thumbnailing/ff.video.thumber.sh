#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
## FILE & FOLDER ROUTINE CHECK

  if [ ! -d "$PWD/thumbs" ]; then
        mkdir -p $PWD/thumbs
fi

INPUT=( $( find -L $PWD -maxdepth 1 -type f -name '*.mp4' ) )
 if [ -z "$INPUT" ];
 	then
 		INPUT=( $( find $PWD -maxdepth 1 -type f -name '*.mp4' ) )
 	else
 		INPUT="$1"
 fi

if [[ ! "${INPUT[@]}" ]]; then
		echo "nope there is no file -- ending the encoding engine..."
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.video.thumber.sh  [ACTIVE] y

