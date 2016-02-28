#!/bin/bash
HERE=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

THISURLCHECK="$( echo $PWD )/$1"
if [[ "$( echo $THISURLCHECK | grep '/srv/www/' )" != "" ]]; then
	THISURLOPEN=$THISURLCHECK
	echo $THISURLOPEN > /tmp/.cache_script
	sed -i -e "s/\/srv\/www\/default\/htdocs/http:\/\/$( hostname -s)/g" /tmp/.cache_script
	sed -i -e "s/\/srv\/www\/$( hostname -s )\/htdocs/http:\/\/$( hostname -s)/g" /tmp/.cache_script
	sed -i -e "s/\/srv\/www\/html/http:\/\/$( hostname -s)/g" /tmp/.cache_script
	sed -i -e "s/\/srv\/www\/htdocs/http:\/\/$( hostname -s)/g" /tmp/.cache_script
	sed -i -e "s/\/srv\/www\/htdocs/http:\/\/$( hostname -s)/g" /tmp/.cache_script	
#
#	chromium-browser "$THISURLOPEN" 
	while read line; do 
	 	firefox $line </dev/null
	 	#chromium-browser $line < /dev/null
	 	#echo "this is webpath :: $line"
	done < /tmp/.cache_script
	> /tmp/.cache_script
fi	



################### END
cd $HERE
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.web.preview "
#  echo "example:  ff.web.preview  "
#fi
## TALON:
XeF


