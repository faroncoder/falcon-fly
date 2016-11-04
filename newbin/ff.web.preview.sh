#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

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
	 	firefox --url $line --new-tab --private 
	 	#chromium-browser $line < /dev/null
	 	#echo "this is webpath :: $line"
	done < /tmp/.cache_script
	> /tmp/.cache_script
fi	



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.web.preview.sh  [ACTIVE] y

