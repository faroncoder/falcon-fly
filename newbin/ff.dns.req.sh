#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

dig "$1" all | sed '/;/d' | sed '/^$/d'

echo -e "$fcok $fcy$( basename $0 )$fco"

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.dns.req.sh  [ACTIVE] y

