#!/bin/bash
startgreen=`date +%s`
#GETFILES=( $( find . -maxdepth 1 -type f -exec basename {} \; ) )
GETFILES=( `find . -maxdepth 1 -type f -exec basename {} \;` )
for f in "${GETFILES[@]}"; do
	PREFILE="$( rev <<< $f | cut -d "." -f2 | rev )"
	echo "<a href=\"http://$( hostname --short).faron.ca:8800/$f\" id =\"$PREFILE\" ><img src=\"http://$( hostname --short ).faron.ca:8800/thumbs/$PREFILE.png\" border='0'></img>$f</a><br />" >> links.html
	done
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
## FARON.FALCON.HTML_LINKS_TO_FILES_IN_SAME_DIR

