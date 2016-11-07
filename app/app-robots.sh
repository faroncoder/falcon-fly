#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
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
binpull="/home/users/faron/.falcon/scripting/dat"
#######
cat $binpull/robots.txt > $pathdir/
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] app-robots.sh  [ACTIVE] y

