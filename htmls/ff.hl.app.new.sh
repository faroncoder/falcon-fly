#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}


#################### BEGIN

#PATHDIR=/srv/www/htdocs/.jsc/projects
APPNAME="$1"
if [ -z "$APPNAME" ]; then
echo -n "name of new project? "
read APPNAME
APPNAME=`basename $APPNAME`
fi


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


stopwatchtime
## TALON: ff.hl.app.new


