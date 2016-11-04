#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
source /usr/bin//find /home/users/$USER/.local/share/applications/ -type f -name 'chrome-*' ! -name 'chrome-faron*' -exec rm {} \;

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.clean-chrome-profiles.sh  [ACTIVE] y

