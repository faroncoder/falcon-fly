#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

if [[ "$( hostname -s  )" == "f8" ]]; then
	echo -e "$Fno we are on master server...$Fyellow exiting.$Foff"
	exit 1
else
	echo -e -n "$Fwarn sync-ing falcon scripts..."
	rsync -avzh --delete --exclude .git --exclude Sublime faron@192.168.1.8:~/.falcon/scripts ~/.falcon/
	/usr/local/bin/ff.load
fi


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.sync.sh  [ACTIVE] y

