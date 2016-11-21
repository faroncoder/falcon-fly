#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
#sudo flumotion-worker -d 3 -v -T tcp  -u faron -p great /etc/flumotion/workers/default.xml
flumotion-worker -d 3 -v -T tcp  -u faron -p Gnothi7411 /etc/flumotion/workers/default.xml
#flumotion-worker -d 3 -v -T tcp -u faron -p great

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.flu.2.sh  [ACTIVE] y

