#!/bin/bash
startgreen=`date +%s`
ls  > links.txt
> links.html
while read line
	do
	echo "<iframe src=\"./jsc/media/htmls/$line\" width=\"400\" height=\"285\"frameborder=\"0\" scrolling=\"no\"></iframe>" >> links.html
	done < links.txt
rm links.txt
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
