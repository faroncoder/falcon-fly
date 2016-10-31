#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

#sudo flumotion-manager -v -T tcp -H 192.168.1.10 -P 8642 /etc/flumotion/managers/default/planet.xml
flumotion-manager -v -T tcp -H $( hostname -i ) -P 8642 /etc/flumotion/managers/default/planet.xml

#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.flu.1.sh  [ACTIVE] y

