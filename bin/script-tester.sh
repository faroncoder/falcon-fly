#!/bin/bash
startgreen=`date +%s`
FILE="$1"
if [ -z "$FILE" ];
	then
	find $PWD ! -perm /+x
	echo -n "which file you need to test? "
	READ FILE
fi
cd $PWD
chmod /+x $FILE
./$FILE
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
\#!/bin/bash
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0


stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

