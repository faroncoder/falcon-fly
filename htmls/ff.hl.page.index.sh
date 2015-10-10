#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
	#exit 0
}


#################### BEGIN

#PATHDIR=/srv/www/htdocs/.jsc/projects
APP="/srv/www/htdocs/.jsc/projects/`basename $1`"
if [ "$APP" = '' ]; then
	echo "Aborting : no path for the project specificed. "
	stopwatchtime
	break
fi

if [ ! -d "$APP" ];
	then
	`/home/faron/.bin/ff.hl.app.new $APP`
fi

if [ ! -f "$APP/index.html" ];
	then
	sudo cp "/home/faron/.falcon/scripts/htmls/VAULT/html-full.txt" "$APP/index.html"
	echo "index.html created in $APP"
	else
	echo "index.html exists ($APP/index.html)."
fi



################### END


stopwatchtime
## TALON: ff.hl.app.new


