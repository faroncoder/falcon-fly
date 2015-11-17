#!/bin/bash
if [ "$( echo $PATH | grep '/home/faron/.bin/' )" = '' ]; then
	export PATH=$PATH:/home/faron/.bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> /home/faron/.falcon/logs/scripts.log; exit 0
}

#if [ "$1" != "" ]; then
#################### BEGIN

export PATH=$PATH:/home/faron/.bin

DOMAINS=( faron.ca  faronhost.ca faronintel.ca phoenixsafety.ca f1 f6 f7 f10 )

for check in "${DOMAINS[@]}"; do
	GETRESULT="$( ping -c 3 $check  2> /dev/null )"
	if [ ! -z "$GETRESULT" ]; then
		notify-send  "$check" -i /home/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/tick_32.png
	else
		notify-send  "$check" -i /home/faron/.falcon/scripts/icons/set-1/Basic_set_Png/Basic_set_Png/help_32.png
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


