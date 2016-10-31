#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN


## grab the function in getting interface name
MEEF=`source /usr/local/bin/ff.net.devices`

echo -e "$Fwarn switching $MEEF off"
$SUDO ifconfig $MEEF down

$SUDO ifconfig $MEEF up
echo -e "$Fstat switching $MEEF on"
$SUDO service networking reload
echo -e "$Fok"


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.iface-reset.sh  [ACTIVE] y

