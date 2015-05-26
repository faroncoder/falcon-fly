#!/bin/bash
startgreen=`date`

echo "Installing whitelist systemtray (gnome)"
sudo add-apt-repository ppa:gurqn/systray-utopic
sudo apt-get update
sudo apt-get upgrade
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

