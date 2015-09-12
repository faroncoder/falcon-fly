#!/bin/bash
startgreen=`date +%s`
sudo flumotion-worker -d 3 -v -T tcp  -u faron -p great /etc/flumotion/workers/default.xml

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

