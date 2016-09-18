#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}

# if [ "$1" != "" ]; then
#################### BEGIN
LOADERBIN=$HOME/.falcon/scripts/htmls/VAULT
CURPATH=""
APPNAME=$1

loadJSC() {
if [ "$nwjsc" == 0 ]; then
		tar -jxvf $LOADERBIN/jsc-build.tar.bz2
		nwjsc=1
else
		echo "JSC already loaded."
fi
}

starter() {
if [ -z "$( echo $PWD | grep '/srv/www' )" ]; then
	CURPATH=$PWD
fi
if [ ! -z $( echo $PWD | grep '/srv/www' ) ] && [ -d $( echo $PWD | grep '.jsc/projects' ) ]; then
	CURPATH=/srv/www/htdocs/.jsc/projects
	cd $CURPATH
fi

echo "Project path: $CURPATH"
echo -n "New project name ? "
read APPNAME
PROJ="$CURPATH/$APPNAME"
if [ ! -d "$PROJ" ]; then
	mkdir -p $PROJ
	echo "Current => $PROJ "
	cd $PROJ
fi
if [ -d "$PROJ" ]; then
	echo "Current => $PROJ "
	cd $PROJ
fi
}

statusGet() {
JSC=""
if [[ "$( find $PROJ -maxdepth 1 -type d -name '*jsc*' )" != '' ]]; then
	JSC="JSC ✓"
	jscnw="1"
	if [ -d "$PROJ/jsc" ];
		then
		jscloc="$PROJ/jsc"
	fi
	if [ -d "$PROJ/.jsc" ];
		then
		jscloc="$PROJ/.jsc"
	fi
else
# if [ -d "$PROJ/jsc" ]; then
	JSC="JSC ✗"
	nwjsc="0"
fi
echo $JSC
# if [[ ! -d "$PROJ/.jsc" ]] && [[ ! -d "$PROJ/jsc" ]]; then

# fi
}

jscInit() {
ff.hl.jsglop $PROJ
ff.hl.cssglop $PROJ
}


newHTML() {
	echo -n "name of html file? "
	read NAMEPAGE
	echo -n "title of the page? "
	read PAGETITLE
	cp "$LOADERBIN/html-full.txt" "$PROJ/$NAMEPAGE.html"
	sed -i -e "s/{TITLE}/$PAGETITLE/g" "$PROJ/$NAMEPAGE.html"
	echo "$NAMEPAGE.html => built!"
 }

starter
SELECT=""
while [[ "$SELECT" != $"\x0a" && "$SELECT" != $"\x20" ]]; do
    echo "[ n=new page | s=status | j=JSC build | p=new plugin | x=exit ]"
    #echo "Press <Enter> to do foo"
    #echo "Press <Space> to do bar"
    #read -s -N 1 SELECT
    IFS= read -s -n 1 SELECT
 	echo "Current cmd: $SELECT"
 	case "$SELECT" in
 		n) newHTML break ;;
		i) ff.ip break ;;
		j) jscInit break ;;
		s) statusGet break ;;
		a) loadAJAX break ;;
		x) echo "exiting spawner"; break ;;
		*) break;;
	esac


done

stopwatchtime


################### END
# elif [ "$1" = "" ];
# 	then
#   echo "usage: keystroke-capture "
#   echo "example:    "
# fi


## TALON: keystroke-capture


