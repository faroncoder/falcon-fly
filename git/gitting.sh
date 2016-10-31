#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
dom="$1"
app="$2"
if [ -z $1 ]
	then
	echo -n "Which domain? "
	read dom
fi
if [ -z $2 ]
	then
	echo -n "Name of app? "
	read app
fi
pathdir="/home/www/$dom/html/$app"
binpull="home/faron/.bin/core/scripts/home/faron/.falcon-fly"
##########################
if [ ! -d "/home/www/$dom" ]
	then
	echo "invalid domain.  exiting."
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] gitting.sh  [ACTIVE] y

