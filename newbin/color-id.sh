#!/bin/bash
startgreen=`date +%s`

for i in {1..100}
	do
 		# your-unix-command-here
 		LS_COLORS="di=1;$i"
 		export LS_COLORS;
 		ls;
	done
# ME=
# LS_COLORS="di=1;$ME"
# export LS_COLORS;


# ls




stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

