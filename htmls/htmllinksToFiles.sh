#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source  /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source  /usr/local/lib/faron_falcon/colors; source  /usr/local/lib/faron_falcon/functions; startTime
####################START
ls  > links.txt
> links.html
while read line
	do
	echo "<iframe src=\"./jsc/media/htmls/$line\" width=\"400\" height=\"285\"frameborder=\"0\" scrolling=\"no\"></iframe>" >> links.html
	done < links.txt
rm links.txt
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] htmllinksToFiles.sh  [ACTIVE] y

