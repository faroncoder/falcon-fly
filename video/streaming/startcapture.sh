#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

THISFILE=$( cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1  )

nohup $( firewire-recording $THISFILE ) & sleep 3; ffplay "$THISFILE.mpg";
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] startcapture.sh  [ACTIVE] y

