#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
wget -nv https://download.owncloud.org/download/repositories/stable/Ubuntu_15.10/Release.key -O Release.key
sudo apt-key add - < Release.key 

sudo sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Ubuntu_15.10/ /' >> /etc/apt/sources.list.d/owncloud.list"
sudo apt-get update
sudo apt-get install owncloud


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] install_owncloud.sh  [ACTIVE] y

