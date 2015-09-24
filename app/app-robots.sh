#!/bin/bash
startgreen=`date +%s`
appname="$1"
if [ -z $1 ]
	then
	echo -n "Name of app? "
	read appname
fi
if [ ! -d "/home/www/html/$appname" ]
	then
	echo "invalid domain.  exiting."
	exit 1
fi
pathdir="/home/www/html/$appname"
binpull="/home/fly/scripting/dat"
#######
cat $binpull/robots.txt > $pathdir/
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
