#!/bin/bash
startgreen=`date +%s`
FIL="$1"
ln -s "$PWD/$1" "$HOME/bin/$1"
rename 's/.sh//g' $HOME/bin/$1
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
