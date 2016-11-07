#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
####################START
while :
do
SELECT=""
 	case "$SELECT" in
 		v) ./ff.generate.html.video.sh break ;;
		x) echo "exiting spawner"; break ;;
		*) break;;
	esac


done

echo "_ok"
###################STOP
doneTime
### [FILE] ff.script.kill.sh  [ACTIVE] y


