#!/bin/bash
startgreen=`date +%s`
 dvgrab -noavc -format dv2 -guid 1 - | ffplay -
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
