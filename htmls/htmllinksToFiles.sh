#!/bin/bash
startgreen=`date +%s`
ls  > links.txt
> links.html
while read line
	do
	echo "<iframe src=\"./jsc/media/htmls/$line\" width=\"400\" height=\"285\"frameborder=\"0\" scrolling=\"no\"></iframe>" >> links.html
	done < links.txt
rm links.txt
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
