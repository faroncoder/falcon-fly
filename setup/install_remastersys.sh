#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
sudo add-apt-repository ppa:mutse-young/remastersys
ff.apt.update
ff.apt.fetch remastersys
###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] install_remastersys.sh  [ACTIVE] y

