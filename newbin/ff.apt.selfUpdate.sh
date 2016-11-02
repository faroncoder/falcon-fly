#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

cd /home/users/$USER 1> /dev/null

if [[ ! -f updateServer ]]; then exit 0; else

while read line
	do
		ff.apt.fetch $line 1&2> /dev/null
		logger "FALCON: Apt-get installed $line"
	done < updateServer
rm updateServer
fi

#echo -e ${_ok}"$Fyellow $( basename $0 ) $Foff"

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.selfUpdate.sh  [ACTIVE] y

