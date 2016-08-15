#!/bin/bash
startgreen=`date +%s`
#sudo flumotion-worker -d 3 -v -T tcp  -u faron -p great /etc/flumotion/workers/default.xml
flumotion-worker -d 3 -v -T tcp  -u faron -p Gnothi7411 /etc/flumotion/workers/default.xml
#flumotion-worker -d 3 -v -T tcp -u faron -p great

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0

