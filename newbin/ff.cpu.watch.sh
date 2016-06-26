#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
	exit 0
}

if [ "$1" != "" ]; then
#################### BEGIN
THIS=$(( $( top -bn1  | awk '{print $1"|"$9"|"$10"|" }' | awk 'NR>=6 {print}' | head -n 23 | wc -l ) - 1 ));

## place your script here


################### END
elif [ "$1" = "" ];
	then
  echo "usage: ff.cpu.watch "
  echo "example:    "
fi

stopwatchtime
## TALON: ff.cpu.watch


