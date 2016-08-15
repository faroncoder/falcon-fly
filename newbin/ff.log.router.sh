#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
#if [[ "$1" != "" ]]; then
#################### BEGIN

if [[ $USER != 0 ]]; then
	SUDO="sudo "
fi

$SUDO grep 'ns0-lan1.faron.ca' /var/log/syslog  >> /mnt/falcon/logs/router/router.log  && $SUDO sed -i -e '/ns0-lan1.faron.ca/d' /var/log/syslog


################### END
#cd $RETURN
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

