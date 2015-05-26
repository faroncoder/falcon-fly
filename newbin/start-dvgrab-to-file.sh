#!/bin/bash
startgreen=`date`
dvgrab -format avi -guid 1 -noavc $PWD/live.avi

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

