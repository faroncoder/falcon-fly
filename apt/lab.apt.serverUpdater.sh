#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN


if [[ ! -f /home/users/faron/updateServer ]]; then exit 0; else

while read line
	do
		ff.apt.fetch $line 2> /dev/null  < /dev/null
		logger "FALCON: Apt-get installed $line"
	done < /home/users/faron/updateServer
	rm updateServer
fi

#echo -e $Fok"$Fyellow $( basename $0 ) $Foff"

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.apt.serverUpdater.sh  [ACTIVE] y

