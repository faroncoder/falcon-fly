#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

/.bin/chown -R www-data:www-data /home/faron/var/Scripts/htmls/projects
/.bin/chmod -R 775 /home/faron/var/Scripts/htmls/projects

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] www-chown-modizer.sh  [ACTIVE] y

