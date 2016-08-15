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

if [ "$1" != "" ]; then
#################### BEGIN


## place your script here


################### END
elif [ "$1" = "" ];
	then
  echo "usage: ff.mongo.insert "
  echo "example:    "
fi

stopwatchtime
## TALON: ff.mongo.insert


