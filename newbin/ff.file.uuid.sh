#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

GETALL=( $( find . -maxdepth 1 -type f -exec basename {} \; ) )
for n in "${GETALL[@]}"; do
		STPLOC=$( dirname $n )
		STPFILE=$( basename $n );
		STPNAME=$( echo $STPFILE | cut -d"." -f 1 );
		PREFILE=$( rev <<< "$STPFILE" | cut -d "." -f2 | rev )
		EXTE=$( rev <<< "$STPFILE" | cut -d "." -f1 | rev )
		mv $n "$( uuid ).$EXTE"
done

###################STOP
####################START


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.file.uuid.sh  [ACTIVE] y

