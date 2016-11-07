#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START


SUDO=""
if [[ "$USER" == "root" ]]; then
	SUDO="sudo"
fi

$SUDO service apache2 restart


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apache.restart.sh  [ACTIVE] y

