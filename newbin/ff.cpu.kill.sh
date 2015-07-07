#!/bin/bash
CHECKAF="$1"
if [ -z "$1" ]
	then
	echo -n "which service to pidof for?  "
	read CHECKAF
fi



CHECKGET=( `eval pidof $CHECKAF` )

if [ -z "$CHECKGET" ]
	then
	RESULT=0
else
	for k in "${CHECKGET[@]}"; do  sudo kill $k;  done
	RESULT=1
fi

if [[ "$RESULT" == 0 ]]; then
		echo "FALCON:  Not found"
	fi

if [[ "$RESULT" == 1 ]]; then
		echo "FALCON:  These following pidofs were found: `echo \"${CHECKGET[@]}\"`"
		fi


exit 0

