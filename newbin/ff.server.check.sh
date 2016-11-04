#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

export PATH=$PATH:/usr/local/bin

DOMAINS=( faron.ca  faronhost.ca faronintel.ca phoenixsafety.ca f1 f6 f7 f10 )
sendlog() {
	logger $check $status
}

for check in "${DOMAINS[@]}"; do
	GETRESULT="$( ping -c 3 $check  2> /dev/null )"
	if [ ! -z "$GETRESULT" ]; then
		status='is up'
		sendlog
		notify-send  "$check" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/tick_32.png < /dev/null
	else
		DOWNSERVER=( $DOWNSERVER $GETRESULT )
	fi
done

if [ ! "$DOWNSERVER" ]; then
	XeF
else
for down in "${DOWNSERVER[@]}"; do
		status='is down'
		check=$down
		sendlog
		#notify-send  "$down" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/help_32.png
done
fi
###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.server.check.sh  [ACTIVE] y

