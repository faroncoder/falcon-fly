#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

/.bin/chown -R www-data:www-data /home/faron/var/Scripts/htmls/projects
/.bin/chmod -R 775 /home/faron/var/Scripts/htmls/projects

#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] www-chown-modizer.sh  [ACTIVE] y

