#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
if [[ "$1" != "" ]]; then
#################### BEGIN

while read line; do
	echo -e "$Finfo $line $Foff"
	$line
done < $1


################### END
#cd $RETURN
else echo -e $Finfo "Arg 1=$Fyellow path to file for read cmds$Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

