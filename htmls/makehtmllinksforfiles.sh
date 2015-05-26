#!/bin/bash
startgreen=`date`
GETFILES=( "$( find . -maxdepth 1 -type f )" )

for line in "${GETFILES[@]}";
	do
	echo "<a href=\"$line\"><img src=\"$line\" border=\"0\"></img></a>" >> links.html
	done
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
## FARON.FALCON.HTML_LINKS_TO_FILES_IN_SAME_DIR

