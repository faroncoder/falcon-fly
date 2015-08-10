#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}

if [ "$1" != "" ]; then
#################### BEGIN

echo "db.$2.insert({ $3 })" | mongo $1 --quiet
#mongo $1 "/tmp/mongo.dat" 0> /dev/null
#> /tmp/mongo.dat


################### END
elif [ "$1" = '' ] || [ "$2" = '' ] || [ "$3" = '' ]; then
  echo "usage: ff.mongo.insert [collection] '[query stings]'"
  echo "example:  ff.mongo.insert test 'name:\"faron\",country:\"canada\"'"
fi


stopwatchtime
## TALON: ff.mongo.insert


