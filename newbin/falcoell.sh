#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
  stopred=`date +%s`
  faronruntime=$( echo $(( $stopred - $startgreen )) )
<<<<<<< HEAD
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log
=======
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
  exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN


## END
stopwatchtime

