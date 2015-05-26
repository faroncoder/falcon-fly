#!/bin/bash
startgreen=`date`

PATHDIR="$PWD"
rename 's/.sh//g' $PATHDIR/*
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
