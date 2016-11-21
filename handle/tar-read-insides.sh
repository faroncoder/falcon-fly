#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

find -type f -name '*tar.gz' -exec basename {} \; >> $HOMEtar.list
while read line
	do
		echo "$line" >> $HOMEtars-listings.list
		tar -tf $line >> $HOMEtars-listings.list
		echo "--------" >> $HOMEtars-listings.list
	done < $HOMEtar.list
rm $HOMEtar.list

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] tar-read-insides.sh  [ACTIVE] y

