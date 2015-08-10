#!/bin/bash
startgreen=`date +%s`

sudo apt-get build-dep $1
sudo apt-get -y install $1


stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
