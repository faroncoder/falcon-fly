#!/bin/bash
startgreen=`date +%s`

<<<<<<< HEAD
find -type f -name '*tar.gz' -exec basename {} \; >> $HOMEtar.list
while read line
	do
		echo "$line" >> $HOMEtars-listings.list
		tar -tf $line >> $HOMEtars-listings.list
		echo "--------" >> $HOMEtars-listings.list
	done < $HOMEtar.list
rm $HOMEtar.list

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
=======
find -type f -name '*tar.gz' -exec basename {} \; >> ~/tar.list
while read line
	do
		echo "$line" >> ~/tars-listings.list
		tar -tf $line >> ~/tars-listings.list
		echo "--------" >> ~/tars-listings.list
	done < ~/tar.list
rm ~/tar.list

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347


