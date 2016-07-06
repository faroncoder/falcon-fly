#!/bin/bash
startgreen=`date +%s`
echo "y\\n" > mkvrespond.txt
/mnt/falcon/scripts/video/mkv-er.sh < mkvrespond.txt

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
