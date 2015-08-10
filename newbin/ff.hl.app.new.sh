#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}


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


stopwatchtime
## TALON: ff.hl.app.new


