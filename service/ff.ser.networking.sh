#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START


$SUDO service networking restart

echo -e "${_info} networking service restarted"


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.ser.networking.sh  [ACTIVE] y

