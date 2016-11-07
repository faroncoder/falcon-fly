#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

WWWD=/srv/www/htdocs

find $WWWD -maxdepth 1


####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] www-chmod-chown-auto.sh  [ACTIVE] y

