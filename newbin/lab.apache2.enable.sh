#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

MODSENABLE=( FARONFUCKSIN )
for m in "${MODSENABLE}"; do
	sudo a2enmod $m 2>&1 /dev/null


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.apache2.enable.sh  [ACTIVE] y

