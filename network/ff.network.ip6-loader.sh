#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN


GETIP6=`hostname -I | tr ' ' '\n' | grep ':'`
echo $GETIP6

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.network.ip6-loader.sh  [ACTIVE] y

