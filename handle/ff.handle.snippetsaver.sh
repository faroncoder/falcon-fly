#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

HUNTFILE=( `find -L /home/users/faron/.falcon/code/sublime/User -maxdepth 1 -type f -name '*-snippet'  `  )
if [[ ! -z "$HUNTFILE" ]]; then
        for snippet in "${HUNTFILE[@]}"; do
        	FILEME=$( basename $snippet )
        	logger "Found: $FILE and moving to resident folder"
        	mv $snippet /home/users/faron/.falcon/code/sublime/mysnippets/
        	CHECKME=$( ls -al /home/users/faron/.falcon/code/sublime/mysnippets/$FILEME )
        	if [[ ! -z "$FILEME" ]]; then
        		echo "$FILEME secured."
        	fi
        	ff.notify.echo "Found: $( basename $snippet )" < /dev/null
        done
fi


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.handle.snippetsaver.sh  [ACTIVE] y

