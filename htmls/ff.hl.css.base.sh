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
<<<<<<< HEAD
	sudo cp "/home/faron/.falcon/scripts/htmls/VAULT/css-full.txt" "$APP/.jsc/css/style-BASE.css"
=======
<<<<<<< HEAD
	sudo cp "/home/users/faron/.falcon/scripts/htmls/VAULT/css-full.txt" "$APP/.jsc/css/style-BASE.css"
=======
	sudo cp "/mnt/falcon/scripts/htmls/VAULT/css-full.txt" "$APP/.jsc/css/style-BASE.css"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	ff.hl.css.glop $$APP
	echo "$APP: style-BASE loaded."
	else
	echo "$APP: style-BASE already injected."
fi

################### END


stopwatchtime
## TALON: ff.hl.css.base


