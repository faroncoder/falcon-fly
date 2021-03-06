#!/bin/bash
startgreen=`date +%s`
rm -f $PWD/*.*~
rm -f $PWD/.*_*~
rm -f $PWD/*.sh~
rm -f $PWD/*~
rm -f $PWD/.*~
rm -f $PWD/*.*save
rm -f $PWD/*.*save*
find $PWD -maxdepth 1 -type f -name '.*~' -exec rm -f {} \;
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
