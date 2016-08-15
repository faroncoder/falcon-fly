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

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0


