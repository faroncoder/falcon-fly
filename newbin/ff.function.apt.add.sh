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

#################### BEGIN

if [ ! "$EUID" = 0 ]; then
    echo "su yourself in first, Faron"
    stopwatchtime
else

<<<<<<< HEAD
APTLIST="/home/users/faron/.falcon/apt/aptlist.list"
=======
APTLIST="/mnt/falcon/apt/aptlist.list"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8


if [ "$1" != "" ]; then
	echo $1 >> $APTLIST
	echo "$1 added"
	stopwatchtime
else
	GRAB=( $( cat $APTLIST | uniq | sort ) )
	for f in "${GRAB[@]}"; do
		ff.apt.fetch $f
	done
fi

fi
################### END


stopwatchtime
## TALON: ff.setup.apt-install


