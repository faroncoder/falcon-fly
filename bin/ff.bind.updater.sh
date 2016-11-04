#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START


mv /etc/bind/db.root /etc/bind/db.root_old
wget -q -O /etc/bind/db.root http://www.internic.net/zones/named.root
service bind9 reload
logger "BIND9 Table updated!"

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.bind.updater.sh  [ACTIVE] y

