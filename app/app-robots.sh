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
<<<<<<< HEAD
pathdir="/home/www/html/$appname"
binpull="$HOME/.falcon/scripting/dat"
#######
cat $binpull/robots.txt > $pathdir/
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
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
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
