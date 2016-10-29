#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
if [[ "$1" != "" ]]; then
#################### BEGIN

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
	echo "$Fwarn repairing $SystemFile"
	ffmpeg -fflags genpts -i $j -y -codec copy -flags +global_header -map 0:0 -acodec copy $FileAsFixed < /dev/null;
	echo "$Fok done!"
done

################### END
#cd $RETURN 1> /dev/null;
else echo -e "$Fstat $Fred Arg 1 $Foff= File(s) to repair $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y

