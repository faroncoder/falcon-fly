#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
FILES="$1"
if [ -d "$FILES" ]
      then
            cp -r -u $FILES /home/trashbin/
            rm -r $FILES
            echo "$FILES trashed"
      else
            cp -u $FILES /home/trashbin
            rm $FILES
            echo "$FILES trashed"
      fi
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] rm-safety-delete.sh  [ACTIVE] y

