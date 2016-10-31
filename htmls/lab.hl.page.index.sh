#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

PATHDIR=/srv/www/htdocs/.jsc/projects
if [ ! -d $PATHDIR ]; then
	mkdir -p $PATHDIR
fi

if [[ ! -z $1 ]]; then
	APP="$PATHDIR/$( basename $1 )"
fi

if [ ! -d "$APP" ]; then
	echo "Aborting : no path for the project specificed. "
	stopwatchtime
fi
if [ -d "$APP" ];
	then
	ff.hl.app.new $APP
fi

if [ ! -f "$APP/index.html" ];
	then
	sudo cp "$HOME/.falcon/scripts/htmls/VAULT/html-full.txt" "$APP/index.html"
	echo "index.html created in $APP"
	else
	echo "index.html exists ($APP/index.html)."
fi



################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.hl.page.index.sh  [ACTIVE] y

