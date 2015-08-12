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
APPNAME=`basename $1` >&2 /dev/null
if [ -z "$APPNAME" ]; then
echo -n "name of new project? "
read APPNAME
fi

APP="/var/www/html/.jsc/projects/`basename $APPNAME`"

if [ ! -d "$APP" ]; then
	sudo mkdir -p $APP
	ff.hl.jsc.init $APP
	ff.hl.page.index $APP
else
	echo "App already ready for development"
fi



################### END


stopwatchtime
## TALON: ff.hl.app.new


