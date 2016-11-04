#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
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
	pathdir="/drive/home/users/$USER/var/Scripts/nodes/projects/$appname/public"

fi
if [ "$typedest" == "h" ]
	then
	pathdir="/drive/home/users/$USER/var/Scripts/htmls/projects/$appname"
fi

binpull="home/faron/.bin/core/scripts/mnt/falcon-fly/app/libsafe"
	cp $binpull/jUploader.tar.gz $pathdir/
	echo "unpacking jsc build"
	cd $pathdir
	tar -zxvf jUploader.tar.gz
	echo "cleaning installation files and sync-ing all files for node & public files..."
	rm jUploader.tar.gz
	mv stylesheets/* jsc/css/
	mv images/* jsc/img/
	mv fonts/*  jsc/fonts/
	mv javascripts/* jsc/js/
	rm -r images javascripts stylesheets fonts
	echo "finishing up jsc building... "
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] app-uploader.sh  [ACTIVE] y

