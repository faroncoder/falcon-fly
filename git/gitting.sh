#!/bin/bash
startgreen=`date +%s`
dom="$1"
app="$2"
if [ -z $1 ]
	then
	echo -n "Which domain? "
	read dom
fi
if [ -z $2 ]
	then
	echo -n "Name of app? "
	read app
fi
pathdir="/home/www/$dom/html/$app"
binpull="home/faron/.bin/core/scripts/home/faron/.falcon-fly"
##########################
if [ ! -d "/home/www/$dom" ]
	then
	echo "invalid domain.  exiting."
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
fi
cd $pathdir
git remote add origin git@github.com:faroncoder/$app.git
git add --all
git push -u origin master
cd /home/faron/.bin/commands/vault/systemengine/scripting
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
