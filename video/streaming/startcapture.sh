#!/bin/bash
startgreen=`date +%s`

THISFILE=$( cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1  )

nohup $( firewire-recording $THISFILE ) & sleep 3; ffplay "$THISFILE.mpg";
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0


