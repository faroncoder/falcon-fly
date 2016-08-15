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
fi

CHECKFUNCTION=$( basename `echo $( ls -al \`which rm\` | awk '{ print $11 }' )` )

if [ "$CHECKFUNCTION" = "rm_disabled" ]; then
	sleep 18000
	/bin/rm /bin/rm
	/bin/ln -s /bin/rm_safe /bin/rm
	./"$( dirname $0 )/$0"
else
	stopwatchtime
fi


################### END

stopwatchtime
## TALON: ff.function.rm-safe

