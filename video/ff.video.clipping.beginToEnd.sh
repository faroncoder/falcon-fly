#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

PREFILE="$( rev <<< $1 | cut -d "." -f2 | rev )"
EXT="$( rev <<< $1 | cut -d "." -f1 | rev )"
START=$2
END=$3
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.video.clipping.beginToEnd.sh  [ACTIVE] y

