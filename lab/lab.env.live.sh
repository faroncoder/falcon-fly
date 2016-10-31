#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
SELECT=""
while [[ "$SELECT" != $"\x0a" && "$SELECT" != $"\x20" ]]; do
    echo "[ n=new page | s=status | j=JSC build | p=new plugin | x=exit ]"
    #echo "Press <Enter> to do foo"
    #echo "Press <Space> to do bar"
    #read -s -N 1 SELECT
    IFS= read -s -n 1 SELECT
 	echo "Current cmd: $SELECT"
 	case "$SELECT" in
 		v) ./ff.generate.html.video.sh break ;;
		x) echo "exiting spawner"; break ;;
		*) break;;
	esac


done

echo "$Fok"
################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.env.live.sh  [ACTIVE] y

