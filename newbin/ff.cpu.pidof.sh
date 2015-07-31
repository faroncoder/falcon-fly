#!/bin/bash
CHECKAF="$1"
if [ -z "$1" ]; then
	echo -n "which service to pidof for?  "
	read CHECKAF
fi

CHECKGET=( `eval pidof $CHECKAF` )

if [ -z "$CHECKGET" ]; then
	RESULT=0
else
	RESULT=1
fi

if [[ "$RESULT" == 0 ]]; then
		## no action
		echo "" > /dev/null
	fi

if [[ "$RESULT" == 1 ]]; then
		#echo "FALCON:  $CHECKAF pid is running => $(
		PIDOF_GET=`echo ${CHECKGET[@]}`
		#for k in "${CHECKGET[@]}"; do printf $k; done
		#)"
	fi
exit 0

