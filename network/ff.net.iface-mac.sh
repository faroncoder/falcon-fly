#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START


ifconfig | head -n 1 | awk '{ print $5 }'


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.iface-mac.sh  [ACTIVE] y

