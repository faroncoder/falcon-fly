#!/bin/bash
startgreen=`date +%s`
echo "y\\n" > mkvrespond.txt
$HOME/.falcon/scripts/falcon-fly/video/mkv-er.sh < mkvrespond.txt

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
