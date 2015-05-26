#!/bin/sh -e

notify-new "$( tail -n 1 /var/log/syslog )"  -u critical

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

