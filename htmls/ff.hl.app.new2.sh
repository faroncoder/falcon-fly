#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

PATHDIR=/var/www/html/.jsc/projects
APP="$1"

if [ ! -d "$PATHDIR/$APP" ];
	then
	sudo mkdir -p $PATHDIR/$APP
	ff.hl.jsc.init "$PATHDIR/$APP"
else
	echo "App exists ($PATHDIR/$APP)"
fi



################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.hl.app.new2.sh  [ACTIVE] y

