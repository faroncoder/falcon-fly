#!/bin/bash
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
exit 0