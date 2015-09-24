#!/bin/bash
startgreen=`date +%s`
typedest="$1"
appname="$2"
binpull="/home/fly/scripts/falcon-fly/app/libsafe"
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
	pathdir="/home/faron/var/Scripts/node/projects/$appname"
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
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

fi
if [ "$typedest"="h" ] || [ "$typedest"="H" ]
	then
	pathdir="/home/faron/var/Scripts/htmls/projects/$appname"
	mkdir -p $pathdir
	echo "app created and heading to the path now..."
	cd $pathdir
	echo "app is being building..."
	app-jsc h $appname
	echo "configuring $appname ..."
	cp $binpull/html-full.txt $pathdir/index.html
	echo "now we are here and you may begin scripting..."

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
fi


##########################

# if [ ! -d $pathdir ]
#	then
#	echo "creating new project: $appname"
# 	mkdir -p $pathdir
#	html-jsc $pathjsc
# fi



stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
