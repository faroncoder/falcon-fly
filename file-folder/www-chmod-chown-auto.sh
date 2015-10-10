#!/bin/bash
startgreen=`date +%s`

WWWD=/home/www/html

find $WWWD -maxdepth 1


stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
