#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}


#################### BEGIN

#PATHDIR=/var/www/html/.jsc/projects
APP="/var/www/html/.jsc/projects/`basename $1`"
if [ "$APP" = '' ]; then
	echo "Aborting : no path for the project specificed. "
	stopwatchtime
fi

if [ ! -d "$APP" ];
	then
	ff.hl.app.new $APP
fi

if [ ! -f "$APP/index.html" ];
	then
	sudo cp "/home/faron/.falcon/scripting/falcon-fly/htmls/VAULT/html-full.txt" "$APP/index.html"
	echo "index.html created in $APP"
	else
	echo "index.html exists ($APP/index.html)."
fi



################### END


stopwatchtime
## TALON: ff.hl.app.new


