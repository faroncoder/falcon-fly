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

if [[ "$EUID" == "0" ]];
	then
	apt-get build-dep trash-cli
	apt-get install trash-cli
	mv /bin/rm /bin/rm_disable
	ln -s /usr/bin/trash-put /bin/rm
	echo "command 'rm' has been tweaked for safety"
else
	echo "You have to sudo in for this!"
	exit 1
fi


################### END


stopwatchtime
## TALON: ff.setup.trash-rm


