#!/bin/bash
if [ "$( echo $PATH | grep '/usr/local/bin/' )" = '' ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
<<<<<<< HEAD
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
}

#if [ "$1" != "" ]; then
#################### BEGIN

export PATH=$PATH:/usr/local/bin

DOMAINS=( faron.ca  faronhost.ca faronintel.ca phoenixsafety.ca f1 f6 f7 f10 )

for check in "${DOMAINS[@]}"; do
	GETRESULT="$( ping -c 3 $check  2> /dev/null )"
	if [ ! -z "$GETRESULT" ]; then
<<<<<<< HEAD
		notify-send  "$check" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/tick_32.png
	else
		notify-send  "$check" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/help_32.png
=======
<<<<<<< HEAD
		notify-send  "$check" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/tick_32.png
	else
		notify-send  "$check" -i /home/users/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/help_32.png
=======
		notify-send  "$check" -i /mnt/falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/tick_32.png
	else
		notify-send  "$check" -i /mnt/falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/help_32.png
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	fi
done

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: server-check "
#  echo "example:    "
#fi


## TALON: server-check
XeF


