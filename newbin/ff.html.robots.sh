#!/bin/bash
<<<<<<< HEAD
startgreen=`date +%s`; stopwatchtime() { stopred=`date +%s`; 	faronruntime=$( echo "$(( $startgreen - $stopred ))" ); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0 }
=======
startgreen=`date +%s`; stopwatchtime() { stopred=`date +%s`; 	faronruntime=$( echo "$(( $startgreen - $stopred ))" ); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0 }
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
#################### BEGIN




################### END
## TALON: ff.html.robots.sh
stopwatchtime

