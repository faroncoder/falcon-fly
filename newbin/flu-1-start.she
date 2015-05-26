#!/bin/bash
startgreen=`date`
sudo flumotion-manager -v -T tcp /etc/flumotion/managers/faron/planet.xml

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

