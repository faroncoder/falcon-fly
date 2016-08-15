#!/bin/bash
startgreen=`date +%s`

find -type f -name '*tar.gz' -exec basename {} \; >> $HOMEtar.list
while read line
	do
		echo "$line" >> $HOMEtars-listings.list
		tar -tf $line >> $HOMEtars-listings.list
		echo "--------" >> $HOMEtars-listings.list
	done < $HOMEtar.list
rm $HOMEtar.list

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8


