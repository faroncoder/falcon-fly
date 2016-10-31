#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
#find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet'
COLELCT="$( find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet' )"

if [ -z "$COLELCT" ]
            then
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.file-snippetsaver.sh  [ACTIVE] y

