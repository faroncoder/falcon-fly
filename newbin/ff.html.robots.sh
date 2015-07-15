#!/bin/bash
startgreen=`date +%s`; function stopwatchtime() { stopred=`date +%s`; 	faronruntime=$( echo "$(( $startgreen - $stopred ))" ); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0 }
#################### BEGIN




################### END
## TALON: ff.html.robots.sh
stopwatchtime

