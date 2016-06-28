#!/bin/bash
startgreen=`date +%s`

PATHDIR="$PWD"
rename 's/.sh//g' $PATHDIR/*
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
