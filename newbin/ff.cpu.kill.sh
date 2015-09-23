#!/bin/bash
if [[ ! $1 ]]; then
	echo -n "which service? "
	read PIDWHO
fi
PIDWHO=$1
<<<<<<< HEAD

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

if [[ "$PIDGET" -lt 3 ]]; then
	echo "Halting: ${CALU[@]}"
	sudo kill ${CALU[@]}
=======
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
>>>>>>> 4748ad32a0b930be846831c0cf2125fd5f744ff3
	printPID
fi
if [ "$PIDGET" = 1 ]; then
 	printPID
fi
#if [ "$PIDGET" = 0 ] || [ "$PIDGET" = '' ]; then
 #	echo "No service on $PIDWHO"
#fi
exit 0

