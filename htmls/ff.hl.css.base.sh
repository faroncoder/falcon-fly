#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
	exit 0
}


#################### BEGIN

#PATHDIR=/srv/www/htdocs/.jsc/projects
APP="/srv/www/htdocs/.jsc/projects/`basename $1`"
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
	sudo cp "/mnt/falcon/scripts/htmls/VAULT/css-full.txt" "$APP/.jsc/css/style-BASE.css"
	ff.hl.css.glop $$APP
	echo "$APP: style-BASE loaded."
	else
	echo "$APP: style-BASE already injected."
fi

################### END


stopwatchtime
## TALON: ff.hl.css.base


