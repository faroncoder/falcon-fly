#!/bin/bash
startgreen=`date`
echo "y\\n" > mkvrespond.txt
$HOME/.falcon/scripting/falcon-fly/video/mkv-er.sh < mkvrespond.txt

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
