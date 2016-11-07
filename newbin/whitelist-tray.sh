#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

echo "Installing whitelist systemtray (gnome)"
sudo add-apt-repository ppa:gurqn/systray-utopic
sudo apt-get update
sudo apt-get upgrade
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] whitelist-tray.sh  [ACTIVE] y

