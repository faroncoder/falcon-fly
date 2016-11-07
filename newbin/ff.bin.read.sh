#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

CMD="chmod -R 777 $PWD"
if [[ "$EUID" != 0 ]]; then sudo $CMD; else $CMD; fi



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.bin.read.sh  [ACTIVE] y

