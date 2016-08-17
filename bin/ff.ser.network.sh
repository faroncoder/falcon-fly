#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
. /usr/local/lib/faron_falcon/colors; . /usr/local/lib/faron_falcon/functions;
#if [[ "$1" != "" ]]; then
#################### BEGIN

loadSudo

$SUDO service networking restart
echo -e "$Fstatus networking service restart requested "

################### END
#cd $RETURN 1> /dev/null;
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

