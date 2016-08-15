#!/bin/bash
startgreen=`date +%s`
appname="$1"
if [ -z $1 ]
	then
	echo -n "Name of app? "
	read appname
fi
if [ ! -d "/srv/www/htdocs/$appname" ]
	then
	echo "invalid domain.  exiting."
	exit 1
fi
pathdir="/srv/www/htdocs/$appname"
<<<<<<< HEAD
binpull="/home/users/faron/.falcon/scripting/dat"
#######
cat $binpull/robots.txt > $pathdir/
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
binpull="/mnt/falcon/scripting/dat"
#######
cat $binpull/robots.txt > $pathdir/
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
