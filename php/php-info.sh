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
#DIRCOMM="$HOME/bin/commands"
binpull="home/faron/bin/core/scripting/faron-scriptor"
#LOCDIR="$DIRFILE"
#CSFILE="$LOCDIR/jsc/css"
#JSFILE="$LOCDIR/jsc/js"
#CSSENGINE="$CSFILE/cssengine.css"
##########################
cp $binpull/php-info.txt $locfile
exit 0
