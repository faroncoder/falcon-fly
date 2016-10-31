#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

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
	esac


done




################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.falconengine.sh  [ACTIVE] y

