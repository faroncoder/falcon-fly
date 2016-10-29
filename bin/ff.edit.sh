#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
if [[ "$1" != "" ]]; then
#################### BEGIN


filecheck=`which $1`

if [[ -f "$filecheck" ]]; then
	subl $filecheck	
	echo $Fok
else
	echo "$Fno $Fgreen $1 $Foff is not a live command"
fi


################### END
#cd $RETURN 1> /dev/null;
else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow which live command to be edited? $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /usr/local/bin/ff.script.new  [ACTIVE] y


