#!/bin/bash
startgreen=`date +%s`
typedest="$1"
appname="$2"
<<<<<<< HEAD
binpull="/home/users/faron/.falcon/scripts/app/libsafe"
=======
binpull="/mnt/falcon/scripts/app/libsafe"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
if [ -z $1 ]
	then
	echo -n "HTML or Node? "
	read typedest
fi
if [ -z $2 ]
	then
	echo -n "Name of app? "
	read appname
fi

if [ "$typedest"="n" ] || [ "$typedest"="N" ]
	then
	pathdir="/home/users/$USER/var/Scripts/node/projects/$appname"
	mkdir -p $pathdir
	echo "app created and heading to the path now..."
	cd $pathdir
	echo "app is being building..."
	express $pathdir --hbs
	sed -i -e 's/public\/favicon.ico/public\/jsc\/img\/favicon.ico/g' app.js
	sed -i -e 's/\/\/app.use/app.use/g' app.js
	app-jsc n $appname
	echo "fetching and install node from npm rep..."
	npm install
	echo "configuring $appname ..."
	cp $binpull/html-full.txt $pathdir/public/index.html
	echo "app created!  Current directory: $PWD and you may begin scripting..."
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

fi
if [ "$typedest"="h" ] || [ "$typedest"="H" ]
	then
	pathdir="/home/users/$USER/var/Scripts/htmls/projects/$appname"
	mkdir -p $pathdir
	echo "app created and heading to the path now..."
	cd $pathdir
	echo "app is being building..."
	app-jsc h $appname
	echo "configuring $appname ..."
	cp $binpull/html-full.txt $pathdir/index.html
	echo "now we are here and you may begin scripting..."

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
fi


##########################

# if [ ! -d $pathdir ]
#	then
#	echo "creating new project: $appname"
# 	mkdir -p $pathdir
#	html-jsc $pathjsc
# fi



<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
