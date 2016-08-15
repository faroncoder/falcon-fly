#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
	exit 0
}
#################### BEGIN
cd /home/users/faron/.falcon/vm  2> /dev/null
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
	exit 0
}
#################### BEGIN
cd /mnt/falcon/vm  2> /dev/null
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8



################### END
stopwatchtime
## TALON: ff.vm.new


