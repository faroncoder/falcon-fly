#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
if [[ "$1" != "" ]]; then
#################### BEGIN

GETFILES=$1
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
	FileAsTS="$FileNill.ts"
	IamTheFile="$PWD/$FileAsTS"
	if [[ "$GETEXT" != "mp4" || "$GETEXT" != "mkv" ]]; then
		echo "$Fno can't process $SystemFile to $FileAsTS as its type isn't mp4 affliciated."
		exit 1
	else
		echo "$Fwarn processing $SystemFile to $FileAsTS"
		ffmpeg -fflags genpts -i $j -flags +global_header -map 0:0 -codec copy -bsf:v h264_mp4toannexb $IamTheFile < /dev/null;
		echo "$Fok done!"
	fi
done

################### END
#cd $RETURN 1> /dev/null;
else echo -e "$Fstat $Fred Arg 1 $Foff= File(s) to be processed into _.ts $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.vid.unpack.run.sh  [ACTIVE] y