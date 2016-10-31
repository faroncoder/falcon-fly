#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN


QUERY="{\"$3\":\"$4\"}"
echo "db.$2.insert( $QUERY )" | mongo $1 --quiet 2>/dev/null 
echo -e "$fcok"

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] fm.insert.sh  [ACTIVE] y

