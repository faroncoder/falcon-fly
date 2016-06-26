#!/bin/bash
startgreen=`date +%s`

SRVR=`hostname -s`
cd /
sudo tar -zcvpf "$SRVR_backup.tar.gz" --exclude=/$SRVR_backup.tar.gz \
--directory=/ --exclude=proc --exclude=sys \
--exclude=home --exclude=dev/pts --exclude=var/www --exclude=backups .

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0

