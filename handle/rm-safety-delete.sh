#!/bin/bash
startgreen=`date +%s`
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
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0