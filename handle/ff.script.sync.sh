#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/loader; startTime
####################START
if [[ "$( hostname -s  )" != "f8" ]]; then
	_send="$CHR24"
	_comment="we are on master server...$b_red exiting$reset."
	_FR
	exit 1
else
	echo -e -n "${_warn} sync-ing falcon scripts..."
#	rsync -avzh --delete --exclude .git --exclude Sublime faron@192.168.1.8:~/.falcon/scripts ~/.falcon/
	rsync -avzh --delete --exclude .git --exclude Sublime ~/.falcon/scripts 192.168.1.20:~/.falcon/
	rsync -avzh --delete --exclude .git --exclude Sublime ~/.falcon/scripts 192.168.1.6:~/.falcon/
	# /usr/local/bin/ff.load
fi
###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.sync.sh  [ACTIVE] y

