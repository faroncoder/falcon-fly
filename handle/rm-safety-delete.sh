#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
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
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] rm-safety-delete.sh  [ACTIVE] y

