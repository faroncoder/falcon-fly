#!/bin/bash
startgreen=`date +%s`
/usr/bin//find /home/faron/.local/share/applications/ -type f -name 'chrome-*' ! -name 'chrome-faron*' -exec rm {} \;

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
