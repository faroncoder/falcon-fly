#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

LOC=$1
if [[ "$LOC" == "" ]]; then
	LOC=$PWD
fi
COLLECT=( `find $LOC -maxdepth 1 -type f -name '*.mp4' -exec basename {} \;` )
for file in "${COLLECT[@]}"; do
	fileme=`echo $file | rev | cut -d'.' -f2 | rev`
	_Html=` echo "<a href=\"http://64.140.118.115:8800/$fileme.mp4\"><img src=\"http://64.140.118.115:8800/thumbs/$fileme.png\"></a>" `
	echo "$_Html" >> links.html
done

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.html.looplinking.sh  [ACTIVE] y

