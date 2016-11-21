#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

MODSENABLE=( FARONFUCKSIN )
for m in "${MODSENABLE}"; do
	sudo a2enmod $m 2>&1 /dev/null


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.apache2.enable.sh  [ACTIVE] y

