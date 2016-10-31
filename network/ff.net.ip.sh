#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN


THIS=`curl http://myip.dnsomatic.com 2> /dev/null`
echo -e "$Finfo Public IP: $THIS"
echo -e "$Finfo Local IP: $( hostname -i )"
echo -e "$Finfo Networked IP: $( hostname -I )"



################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.ip.sh  [ACTIVE] y

