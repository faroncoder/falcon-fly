#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
#find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet'
COLELCT="$( find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet' )"

if [ -z "$COLELCT" ]
            then
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.file-snippetsaver.sh  [ACTIVE] y

