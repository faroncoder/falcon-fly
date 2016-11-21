#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START


## Get the real interface name
#ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d' | head -n 1


## get all of interfaces (including virutuals)
ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d' 


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.iface-all.sh  [ACTIVE] y

