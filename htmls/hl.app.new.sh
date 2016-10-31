#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
CURPATH=
#PATHDIR=/srv/www/htdocs/.jsc/projects
APPNAME="$1"
# if [[ -z "$APPNAME" ]]; then
# echo -n "name of new project? "
# read APPNAME
# APPNAME=$( basename $APPNAME )
# fi

APPLOC="/srv/www/htdocs/.jsc/projects/$APPNAME"

if [ ! -d "$APPLOC" ]; then
	echo "create $APPNAME?"
	read RESPONSEapp
	if [ $RESPONSEapp = 'y' ]; then
		sudo mkdir -p $APPLOC
		ff.hl.jsc.init $APPLOC
		echo "jsc pack created"
		ff.hl.page.index $APPLOC
	fi
else
	echo "App already ready for development"
fi



################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] hl.app.new.sh  [ACTIVE] y

