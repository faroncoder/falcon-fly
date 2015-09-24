#!/bin/bash
PIDWHO="$1"
if [ -z "$PIDWHO" ]; then
	echo -n "which service to pidof for?  "
	read PIDWHO
fi
CHECKGET=( `pidof $PIDWHO` )
NODCALL=`echo ${CHECKGET[@]} | wc -w `
clearPIDS() {
 	PIDGET=''
 	PIDALL=''
 }
checkPIDS() {
 	clearPIDS
 	PIDGET="$NODCALL"
 	PIDALL="${CHECKGET[@]}"
 	echo "Current: $PIDWHO $PIDGET  ${CHECKGET[@]}"
}

checkPIDS

exit 0

