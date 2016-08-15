#!/bin/bash
startgreen=`date +%s`
echo "y\\n" > mkvrespond.txt
/home/users/faron/.falcon/scripts/video/mkv-er.sh < mkvrespond.txt

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
