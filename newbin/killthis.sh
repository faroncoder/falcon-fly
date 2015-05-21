#!/bin/bash
startgreen=`date +%s`

mv $1 $HOME/.falcon/killed/

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

