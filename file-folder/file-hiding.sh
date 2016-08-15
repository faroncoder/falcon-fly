#!/bin/bash
startgreen=`date +%s`
> x.list
find $PWD -maxdepth 1 -type f -exec basename {} \; >> x.list
while read line
	do
		ORGIN=$line
		#CLEANED="$( echo $line | sed 's/\.//g' )"
		mv $line ".$line"
		echo "$ORGIN --> $line as hidden"
	done < x.list
rm x.list
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

