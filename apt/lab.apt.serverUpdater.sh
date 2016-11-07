#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START


if [[ ! -f /home/users/faron/updateServer ]]; then exit 0; else

while read line
	do
		ff.apt.fetch $line 2> /dev/null  < /dev/null
		logger "FALCON: Apt-get installed $line"
	done < /home/users/faron/updateServer
	rm updateServer
fi

#echo -e _ok"$b_yellow $( basename $0 ) $reset"

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.apt.serverUpdater.sh  [ACTIVE] y

