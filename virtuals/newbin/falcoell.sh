#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
  stopred=`date +%s`
  faronruntime=$( echo $(( $stopred - $startgreen )) )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log
  exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN


## END
stopwatchtime

