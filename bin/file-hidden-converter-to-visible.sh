#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
find $PWD -maxdepth 1 -type f -exec basename {} \; > x.list
while read line
	do
		ORGIN=$line
		CLEANED="$( echo $line | sed 's/\.//g' )"
		mv $line $CLEANED
		echo "$ORGIN --> $CLEANED"
	done < x.list
rm x.list
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] file-hidden-converter-to-visible.sh  [ACTIVE] y

