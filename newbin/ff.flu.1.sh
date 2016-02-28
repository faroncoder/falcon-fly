#!/bin/bash
startgreen=`date +%s`

#sudo flumotion-manager -v -T tcp -H 192.168.1.10 -P 8642 /etc/flumotion/managers/default/planet.xml
flumotion-manager -v -T tcp -H $( hostname -i ) -P 8642 /etc/flumotion/managers/default/planet.xml

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0

