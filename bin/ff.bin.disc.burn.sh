#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
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



