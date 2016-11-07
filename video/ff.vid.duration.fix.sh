#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

GETFILES=$1
# if [[ $GETFILES == "" ]]; then
# 	GETFILES=( `find $PWD -maxdepth 1 -type f -name '*.mp4' ! -name '*.sh' ` )
# fi
for j in "${GETFILES[@]}"; do
	PREFILE=$( rev <<< $j | cut -d"." -f2 | rev )
	GETEXT=$( rev <<< $j | cut -d"." -f1 | rev )
	FileNill=`echo $PREFILE | cut -d"-" -f1`
	SystemFile="$FileNill.$GETEXT"
	FileOriginal="$FileNill-original.$GETEXT"
	if [[ -f "$SystemFile" ]]; then
		mv $SystemFile $FileOriginal;
		j="$FileOriginal"
	fi
	FileAsFixed="$PWD/$PREFILE-repaired.$GETEXT"
	echo "$_warn repairing $SystemFile"
	ffmpeg -fflags genpts -i $j -y -codec copy -flags +global_header -map 0:0 -acodec copy $FileAsFixed < /dev/null;
	echo "_ok done!"
done

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.vid.duration.fix.sh  [ACTIVE] y

