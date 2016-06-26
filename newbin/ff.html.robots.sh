#!/bin/bash
startgreen=`date +%s`; stopwatchtime() { stopred=`date +%s`; 	faronruntime=$( echo "$(( $startgreen - $stopred ))" ); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0 }
#################### BEGIN




################### END
## TALON: ff.html.robots.sh
stopwatchtime

