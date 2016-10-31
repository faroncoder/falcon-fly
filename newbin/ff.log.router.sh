#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

if [[ $USER != 0 ]]; then
	SUDO="sudo "
fi

$SUDO grep 'ns0-lan1.faron.ca' /var/log/syslog  >> /home/users/faron/.falcon/logs/router/router.log  && $SUDO sed -i -e '/ns0-lan1.faron.ca/d' /var/log/syslog


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.log.router.sh  [ACTIVE] y

