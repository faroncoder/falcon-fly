#!/bin/bash
startgreen=`date`

sudo apt-get build-dep $1
sudo apt-get install $1


stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
