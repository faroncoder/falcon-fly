#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
	#exit 0
}


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


stopwatchtime
## TALON: ff.hl.app.new


