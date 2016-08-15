#!/bin/bash
startgreen=`date +%s`
dvgrab -format avi -guid 1 -noavc $PWD/live.avi

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0

