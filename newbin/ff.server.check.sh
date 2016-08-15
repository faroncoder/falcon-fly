#!/bin/bash
if [ "$( echo $PATH | grep '/usr/local/bin/' )" = '' ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
<<<<<<< HEAD
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
}

#if [ "$1" != "" ]; then
#################### BEGIN

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
<<<<<<< HEAD
		notify-send  "$check" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/tick_32.png < /dev/null
=======
		notify-send  "$check" -i /mnt/falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/tick_32.png < /dev/null
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
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
<<<<<<< HEAD
		#notify-send  "$down" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/help_32.png
=======
		#notify-send  "$down" -i /mnt/falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/help_32.png
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
done
fi
################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: server-check "
#  echo "example:    "
#fi


## TALON: server-check
XeF


