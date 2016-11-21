#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
typedest="$1"
appname="$2"
binpull="/home/users/faron/.falcon/scripts/app/libsafe"
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
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] app-new.sh  [ACTIVE] y

