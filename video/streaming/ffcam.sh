#!/bin/bash
startgreen=`date`
 dvgrab -noavc -format dv2 -guid 1 - | ffplay -
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
