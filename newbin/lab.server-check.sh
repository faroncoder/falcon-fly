#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

export PATH=$PATH:/usr/local/bin

DOMAINS=( faron.ca  faronhost.ca faronintel.ca phoenixsafety.ca f1 f6 f7 f10 )

for check in "${DOMAINS[@]}"; do
	GETRESULT="$( ping -c 3 $check  2> /dev/null )"
	if [ ! -z "$GETRESULT" ]; then
		notify-send  "$check" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/tick_32.png
	else
		notify-send  "$check" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/help_32.png
	fi
done

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.server-check.sh  [ACTIVE] y

