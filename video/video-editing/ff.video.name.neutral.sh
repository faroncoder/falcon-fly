#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

ALL=( `find . -maxdepth 1 -type f -name '*clipped*' -exec basename {} \; ` )
COUNT=0
for clip in "${ALL[@]}"; do

COUNT=`echo "$COUNT + 1" | bc `
    NAME=`echo $clip | cut -d'-' -f2 `
        EXT=`echo $clip | rev | cut -d'.' -f1 | rev`

    TRMEDS=`echo $clip  | sed "s/.$EXT//g"`
    rename "s/$TRMEDS/$NAME/g" "$PWD/$clip"
done
echo "Total $COUNT found and name-neutaralized"


####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] video-clipping.sh  [ACTIVE] y

