#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
#if [[ "$1" != "" ]]; then
#################### BEGIN

if [[ "$( hostname -s  )" == "f8" ]]; then
	echo -e "$Fno we are on master server...$Fyellow exiting.$Foff"
	exit 1
else
	echo -e -n "$Fwarn sync-ing falcon scripts..."
	rsync -avzh --delete --exclude .git --exclude Sublime faron@192.168.1.8:~/.falcon/scripts ~/.falcon/
	/usr/local/bin/ff.load
fi


################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y

