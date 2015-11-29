#!/bin/bash
startgreen=`date +%s`

sudo apt-get dist-upgrade
sudo apt-get autoremove -y --force-yes
sudo apt-get autoclean -y --force-yes
sudo apt-get clean -y --force-yes
sudo apt-get update -y --force-yes

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0

