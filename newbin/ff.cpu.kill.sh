#!/bin/bash
CHECKAF="$1"
if [ -z "$1" ]; then
	echo -n "which service to pidof for?  "
	read CHECKAF
fi

CHECKGET=( `pidof $CHECKAF` )

# if [ -z "$CHECKGET" ]; then
#	RESULT=0
# else
#	RESULT="$( echo $CHECKGET | wc -w )"
# fi
#	echo $RESULT
RESULT=`echo ${CHECKGET[@]} | wc -w`

if [ "$RESULT" -gt 1 ]
	then
#	sudo ff.cpu.kill "ssh-agent"
#	echo $RESULT
	for p in "${CHECKGET[@]}"
		do
			kill -9 $p
		done
	else
		echo "Not killing"
fi

exit 0

