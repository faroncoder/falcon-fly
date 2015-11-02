#!/bin/bash
export PATH
source $HOME///.bash_ssh
PIDWHO="$1"
if [ ! "$PIDWHO" ]; then
	echo -n "which service to pidof for?  "
	read PIDWHO
fi
FIRECMD=0
clearPIDS() {
 	PIDGET=''
 	PIDALL=''
 	PIDWHO=''
}

checkPIDS() {
	PIDALL=( `pidof $PIDWHO` )
	PIDGET=`echo "${PIDALL[@]}" | wc -w`
		#echo $CMD
}

checkPIDS
if [[ "$PIDWHO" = "ssh-agent" ]]; then
	if [[ "$PIDGET" -gt 3 ]]; then
		sudo kill -9 `pidof $PIDWHO`
		clearPIDS
	fi
	if [[ "$PIDGET" = 0 ]]; then
		ssh-engine
	fi
fi

# if [[ $FIRECMD = 1 ]]; then
#  	echo "$PIDWHO: $PIDGET  ${PIDALL[@]}"
# fi

exit 0

