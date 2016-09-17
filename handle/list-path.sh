#!/bin/bash
startgreen=`date +%s`
for d in *; do echo $d; done | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | jq .
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
