#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN

if [[ "$( hostname -s )" != "f8" ]]; then
	XeF
fi
	HOST="192.168.0.7"
	ME="f8"; YOU="f7";



echo -e "$Finfo $ME >> $YOU"
rsync -avz  /home/users/faron/.falcon/scripts "faron@$HOST:/home/users/faron/.falcon/" --exclude=.git
rsync -avz  /home/users/faron/.falcon/scripts/bash/lib/* "faron@$HOST:/usr/local/lib/faron_falcon/"
echo -e "$Fok"

#echo -e "$Fok $ME >> $YOU"
#rsync -avz /home/users/faron/.falcon/scripts "faron@$HOST:/home/users/faron/.falcon/" --exclude=/home/users/faron/.falcon/scripts/.git
#rsync -avz /usr/local/lib/faron_falcon/* "faron@$HOST:/home/users/faron/.falcon/scripts/bash/lib/" 



################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


