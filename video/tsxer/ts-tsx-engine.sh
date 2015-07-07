#!/bin/bash
startgreen=`date +%s`

cd /home/faron/var/streamings/files/mp4
/home/faron/.bin/ts-tsx-er

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
