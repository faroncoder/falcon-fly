#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START


## grab the function in getting interface name
MEEF=` /usr/local/bin/ff.net.devices`

echo -e "$_warn switching $MEEF off"
$SUDO ifconfig $MEEF down

$SUDO ifconfig $MEEF up
echo -e "_stat switching $MEEF on"
$SUDO service networking reload
echo -e "_ok"


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.iface-clear.sh  [ACTIVE] y

