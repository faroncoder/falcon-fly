#!/bin/bash
startgreen=`date +%s`

WWWD=/srv/www/htdocs

find $WWWD -maxdepth 1


stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
