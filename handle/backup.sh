#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

SRVR=`hostname -s`
cd /
sudo tar -zcvpf "$SRVR_backup.tar.gz" --exclude=/$SRVR_backup.tar.gz \
--directory=/ --exclude=proc --exclude=sys \
--exclude=home --exclude=dev/pts --exclude=var/www --exclude=backups .

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] backup.sh  [ACTIVE] y

