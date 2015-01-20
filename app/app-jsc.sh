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

if [ "$typedest" == "n" ]
	then
	pathdir="/home/faron/lib/script/nodes/projects/$appname/public"

fi
if [ "$typedest" == "h" ]
	then
	pathdir="/home/faron/lib/script/htmls/projects/$appname"
fi

binpull="home/faron/bin/core/scripting/faron-scriptor/app/libsafe"
	cp $binpull/jsc-build.tar.bz2 $pathdir/
	echo "unpacking jsc build"
	cd $pathdir
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
