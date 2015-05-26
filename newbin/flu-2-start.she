#!/bin/bash
startgreen=`date`
sudo flumotion-worker -d 3 -v -T tcp -H 192.168.1.10 -P 8642 -u faron -p great /etc/flumotion/workers/faron.xml

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

