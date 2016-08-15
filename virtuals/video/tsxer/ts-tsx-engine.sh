#!/bin/bash
startgreen=`date +%s`

cd /home/users/$USER/var/streamings/files/mp4
/usr/local/bin/ts-tsx-er

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
