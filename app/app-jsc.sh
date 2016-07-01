#!/bin/bash
startgreen=`date +%s`
typedest="$1"
appname="$2"
if [ -z "$1" ]
	then
	echo -n "HTML or Node? "
	read typedest
fi
if [ -z "$2" ]
	then
 	echo -n "Name of app? "
	read appname
fi

if [ "$typedest"=="n" ] || [ "$typedest"=="N" ]
	then
	pathdir="/home/faron/var/Scripts/node/projects/$appname/public"

fi
if [ "$typedest"=="h" ] || [ "$typedest"=="H" ]
	then
	pathdir="/home/faron/var/Scripts/htmls/projects/$appname"
fi

binpull="/home/faron/.falcon/scripts/app/libsafe"
	cd $pathdir
	cp $binpull/jsc-build.tar.bz2 ./
	echo "unpacking jsc build"
	tar -jxvf jsc-build.tar.bz2
	echo "cleaning installation files and sync-ing all files for node & public files..."
	rm jsc-build.tar.bz2
	mv stylesheets/* jsc/css/
	mv images/* jsc/img/
	mv fonts/*  jsc/fonts/
	mv javascripts/* jsc/js/
	rm -r images javascripts stylesheets fonts
	echo "finishing up jsc building... "
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
