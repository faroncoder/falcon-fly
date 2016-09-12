#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN

COMMIT=$1
cd $HOME/.falcon/scripts 1> /dev/null;
if [[ ! $COMMIT ]]; then
	echo -e -n "$Fstatus Commit message? "
	read COMMIT
else
	exit 1
fi

	git status; git add -A; git commit -am "`echo $COMMIT`"; git push; git pull; git checkout; git checkout master; git fetch; git pull; git push; git checkout; 
	echo "$Fok"


################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


