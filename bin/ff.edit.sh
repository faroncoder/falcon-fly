#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START


filecheck=`which $1`

if [[ -f "$filecheck" ]]; then
	subl $filecheck	
	echo _ok
else
	echo "$_no $b_green $1 $reset is not a live command"
fi


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.edit.sh  [ACTIVE] y

