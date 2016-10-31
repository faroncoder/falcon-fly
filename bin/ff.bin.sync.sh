#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

if [[ "$( hostname -s )" != "f8" ]]; then
	XeF
fi
	HOST="192.168.0.7"
	ME="f8"; YOU="f7";



echo -e "$Finfo $ME >> $YOU"
rsync -avz  /home/users/faron/.falcon/scripts "faron@$HOST:/home/users/faron/.falcon/" --exclude=.git
rsync -avz  /home/users/faron/.falcon/scripts/bash/lib/* "faron@$HOST:source /usr/local/lib/faron_falcon/"
echo -e "$Fok"

#echo -e "$Fok $ME >> $YOU"
#rsync -avz /home/users/faron/.falcon/scripts "faron@$HOST:/home/users/faron/.falcon/" --exclude=/home/users/faron/.falcon/scripts/.git
#rsync -av source /usr/local/lib/faron_falcon/* "faron@$HOST:/home/users/faron/.falcon/scripts/bash/lib/" 



################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.bin.sync.sh  [ACTIVE] y

