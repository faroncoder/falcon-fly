#!/bin/bash
startgreen=`date +%s`
#GETFILES=( $( find . -maxdepth 1 -type f -exec basename {} \; ) )
GETFILES=( ls *.mp4 )
for f in "${GETFILES[@]}"; do
	PREFILE="$( rev <<< $f | cut -d "." -f2 | rev )"
	echo "<a href='http://f10.faron.ca:8800/$PREFILE.mp4' id ='' ><img src='http://f10.faron.ca:8800/thumbs/$PREFILE.png' border='0'></img></a>" >> links.html
	done
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
## FARON.FALCON.HTML_LINKS_TO_FILES_IN_SAME_DIR

