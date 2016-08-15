#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
	exit 0
}
helpecho() {
echo 'usage: ff.mongo.insert [collection] [query stings]'
  echo 'example:  ff.mongo.find faron admin'
  stopwatchtime
}

if [ "$1" != '' ]; then
#################### BEGIN

sudo wodim -eject -tao speed=10 dev=/dev/sr0 -v -data $1

################### END
else
	stopwatchtime
fi
if [ "$1" = '' ]; then
		helpecho
fi
if [ "$1" = '' ] && [ "$2" = '' ]; then
		helpecho
fi
stopwatchtime
## TALON: ff.bin.cdwrite



