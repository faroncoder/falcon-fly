#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

GETFILES=$1
# if [[ $GETFILES == "" ]]; then
# 	GETFILES=( `find $PWD -maxdepth 1 -type f -name '*.mp4' ! -name '*.sh' ` )
# fi
for j in "${GETFILES[@]}"; do
	PREFILE=$( rev <<< $j | cut -d"." -f2 | rev )
	GETEXT=$( rev <<< $j | cut -d"." -f1 | rev )
	FileFiltered=$( rev << $GETEXT | cut -d'-' -f1 | rev )
	IamTheFile="$FileFiltered.$GETEXT"
	FileAsUnpacked="$PWD/$PREFILE-FrameBUnpacked.$GETEXT"
	echo -n "$_warn repairing $IamTheFile"
	ffmpeg -fflags genpts -i $j -codec copy -flags +global_header -map 0:0 -bsf:v mpeg4_unpack_bframes $FileAsUnpacked < /dev/null;
	echo "_ok done!"
done

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.vid.unpack.run.sh  [ACTIVE] y

