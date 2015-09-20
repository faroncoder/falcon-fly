#!/bin/bash
if [[ ! $1 ]]; then
	echo -n "which service? "
	read PIDWHO
fi
PIDWHO=$1
CALU=( `pidof $PIDWHO` )
clearPIDS() {
 	PIDGET=''
 	PIDALL=''
}
checkPIDS() {
 	PIDGET=( `pidof $PIDWHO | wc -w` )
 	PIDALL="${CALU[@]}"
}
printPID() {
	checkPIDS
 	echo "Service $PIDWHO: $PIDGET"
 	#clearPIDS
# 	exit 0
}

## STARTING THE CHECK
checkPIDS

if [[ "$PIDGET" -gt 1 ]]; then
	echo "Halting: ${CALU[@]}"
	kill ${CALU[@]}
	printPID
fi
if [ "$PIDGET" = 1 ]; then
 	printPID
fi
#if [ "$PIDGET" = 0 ] || [ "$PIDGET" = '' ]; then
 #	echo "No service on $PIDWHO"
#fi
exit 0

