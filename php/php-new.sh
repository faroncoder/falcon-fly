#!/bin/bash
dom="$1"
domid="$2"
if [ -z $1 ]
	then
	echo -n "Which domain? "
	read dom
fi
if [ -z $2 ]
	then
	echo -n "Name of file you wish to create (without extention)? "
	read domid
fi
domfile="$domid.php"
locfile="/home/faron/$dom/$domfile"
binpull="home/faron/bin/core/scripting/falcon-fly"
##########################
cp $binpull/php-new.txt $locfile
exit 0
