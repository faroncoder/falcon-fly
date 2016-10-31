#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN


## Get the real interface name
#ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d' | head -n 1


## get all of interfaces (including virutuals)
ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d' 


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.iface-all.sh  [ACTIVE] y

