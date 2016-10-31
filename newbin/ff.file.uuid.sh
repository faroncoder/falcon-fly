#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

GETALL=( $( find . -maxdepth 1 -type f -exec basename {} \; ) )
for n in "${GETALL[@]}"; do
		STPLOC=$( dirname $n )
		STPFILE=$( basename $n );
		STPNAME=$( echo $STPFILE | cut -d"." -f 1 );
		PREFILE=$( rev <<< "$STPFILE" | cut -d "." -f2 | rev )
		EXTE=$( rev <<< "$STPFILE" | cut -d "." -f1 | rev )
		mv $n "$( uuid ).$EXTE"
done

################### END
#################### BEGIN


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.file.uuid.sh  [ACTIVE] y

