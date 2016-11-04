#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
> x.list
find $PWD -maxdepth 1 -type f -exec basename {} \; >> x.list
while read line
	do
		ORGIN=$line
		#CLEANED="$( echo $line | sed 's/\.//g' )"
		mv $line ".$line"
		echo "$ORGIN --> $line as hidden"
	done < x.list
rm x.list
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] file-hiding.sh  [ACTIVE] y

