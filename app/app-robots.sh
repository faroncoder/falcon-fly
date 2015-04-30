#!/bin/bash
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
binpull="$HOME/.falcon/scripting/dat"
#######
cat $binpull/robots.txt > $pathdir/
exit 0
