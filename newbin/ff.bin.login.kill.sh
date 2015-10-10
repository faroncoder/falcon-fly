#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
	exit 0
}

if [ "$1" != "" ]; then
#################### BEGIN

sudo kill -8 `whoami`
## place your script here


################### END
elif [ "$1" = "" ];
	then
  echo "usage: ff.bin.login.kill "
  echo "example:    "
fi

stopwatchtime
## TALON: ff.bin.login.kill


