#!/bin/bash
PIDWHO="$1"
if [ -z "$PIDWHO" ]; then
	echo -n "which service to pidof for?  "
	read PIDWHO
fi
FIRECMD=0
clearPIDS() {
 	PIDGET=""
 	PIDALL=""
 	PIDWHO=""
}

checkPIDS() {
	PIDALL=( `pidof $PIDWHO` )
	PIDGET=( $( echo \"${PIDALL[@]}\" | wc -w ) )
 }

## STARTING THE CHECK
checkPIDS



if [ "$PIDWHO" = 'ssh-agent' ]; then
	if [[ "$PIDGET" -gt 3 ]]; then
		FIRECMD=1
	fi
fi
if [[ $FIRECMD = 1 ]]; then
	sudo kill ${PIDALL[@]}
fi
clearPIDS
exit 0

