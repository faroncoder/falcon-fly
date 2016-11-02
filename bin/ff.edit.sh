#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN


filecheck=`which $1`

if [[ -f "$filecheck" ]]; then
	subl $filecheck	
	echo ${_ok}
else
	echo "$Fno $Fgreen $1 $Foff is not a live command"
fi


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.edit.sh  [ACTIVE] y

