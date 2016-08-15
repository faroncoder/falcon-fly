#!/bin/bash
startgreen=`date +%s`

SRVR=$( hostname -s )
cd /
sudo tar -cvpjf "$SRVR_backup.tar.gz" --exclude=/$SRVR_backup.tar.gz --one-file-system 

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

