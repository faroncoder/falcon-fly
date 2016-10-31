#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN


CHECKMAIN=`ifconfig | grep 'inet addr' | sed '/127.0/d' | awk '{print $2}' | cut -d':' -f 2`
GETIFACE="$( ff.network.devices  | sed '/lo/d' )"
$SUDO ifconfig $( print $GETIFACE ) 0.0.0.0;
ff.net.addr $CHECKMAIN 24



################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.net.updateDevices.sh  [ACTIVE] y

