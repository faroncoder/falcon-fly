#!/bin/bash
startgreen=`date`
ls  > links.txt
> links.html
while read line
	do
	echo "<iframe src=\"./jsc/media/htmls/$line\" width=\"400\" height=\"285\"frameborder=\"0\" scrolling=\"no\"></iframe>" >> links.html
	done < links.txt
rm links.txt
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
