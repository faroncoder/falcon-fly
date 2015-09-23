#!/bin/bash

if [[ ! "$1" ]]; then
	echo -n "which service? "
	read PIDWHO
fi
PIDWHO="$1"

CALU=( `pidof $PIDWHO` )
clearPIDS() {
 	PIDGET=''
 	PIDALL=''
 	exit 0
}
checkPIDS() {
 	PIDGET=( `pidof $PIDWHO | wc -w` )
 	PIDALL="${CALU[@]}"
}
printPID() {
	.0

	checkPIDS
 	sh -c "echo \"$PIDALL\""
 	clearPIDS
 	exit 0
}

## STARTING THE CHECK
checkPIDS

if [[ "$PIDGET" -lt 3 ]] && [[ "$PIDWHO" = "ssh-agent" ]]; then
	#echo "Current: ${CALU[@]}"
	#sudo kill ${CALU[@]}
	#printPID
	echo "Current: $PIDWHO $PIDGET :: ${CALU[@]}"
	exit 0
fi
#if [[ "$PIDGET" -gt 1 ]]; then
#	echo "Halting: ${CALU[@]}"
# 	sudo kill ${CALU[@]}
# 	printPID
# fi

if [ "$PIDGET" = 1 ]; then
 	printPID
fi

if [ "$PIDGET" = 0 ] || [ "$PIDGET" = '' ]; then
 	$0
 	exit 0
fi
exit 0

