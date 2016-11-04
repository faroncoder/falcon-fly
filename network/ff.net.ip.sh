#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START


THIS=`curl http://myip.dnsomatic.com 2> /dev/null`
echo -e "${_info} Public IP: $THIS"
echo -e "${_info} Local IP: $( hostname -i )"
echo -e "${_info} Networked IP: $( hostname -I )"



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.ip.sh  [ACTIVE] y

