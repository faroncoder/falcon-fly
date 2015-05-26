#!/bin/bash
startgreen=`date`

mv $1 $HOME/.falcon/killed/

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

