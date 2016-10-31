#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

THISFILE=$( cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1  )

nohup $( firewire-recording $THISFILE ) & sleep 3; ffplay "$THISFILE.mpg";
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] startcapture.sh  [ACTIVE] y

