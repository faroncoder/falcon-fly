#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
x=( colors functions ); for z in "${x[@]}"; do source /usr/local/lib/faron_falcon/$z; done
#if [[ "$1" != "" ]]; then
#################### BEGIN


CHECKMAIN=`ifconfig | grep 'inet addr' | sed '/127.0/d' | awk '{print $2}' | cut -d':' -f 2`
GETIFACE="$( ff.network.devices  | sed '/lo/d' )"
$SUDO ifconfig $( print $GETIFACE ) 0.0.0.0;
ff.net.addr $CHECKMAIN 24



################### END
#cd $RETURN 1> /dev/null;
else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

