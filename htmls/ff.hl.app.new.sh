#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
=======
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	exit 0
}


#################### BEGIN
<<<<<<< HEAD
=======
<<<<<<< HEAD

PATHDIR=/var/www/html/.jsc/projects
APP="$1"

if [ ! -d "$PATHDIR/$APP" ];
	then
	sudo mkdir -p $PATHDIR/$APP
	ff.hl.jsc.init "$PATHDIR/$APP"
else
	echo "App exists ($PATHDIR/$APP)"
=======
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
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
<<<<<<< HEAD
=======
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
fi



################### END


stopwatchtime
## TALON: ff.hl.app.new


