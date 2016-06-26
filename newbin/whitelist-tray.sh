#!/bin/bash
startgreen=`date +%s`

echo "Installing whitelist systemtray (gnome)"
sudo add-apt-repository ppa:gurqn/systray-utopic
sudo apt-get update
sudo apt-get upgrade
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0

