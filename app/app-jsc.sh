#!/bin/bash
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
	pathdir="/home/faron/lib/script/node/projects/$appname/public"

fi
if [ "$typedest"=="h" ] || [ "$typedest"=="H" ]
	then
	pathdir="/home/faron/lib/script/htmls/projects/$appname"
fi

binpull="/home/faron/bin/core/scripting/faron-scriptor/app/libsafe"
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
exit 0
