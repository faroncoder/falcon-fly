#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
FILEGRAB="$(  find ./input -maxdepth 1 -type f  -name '*.mkv' | sort | head -n1 )"
INPUT="$( basename $FILEGRAB )"

if [ -z "$INPUT" ];
    then
        echo "Nope there is no file"
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.vid.mp4.encode.sh  [ACTIVE] y

