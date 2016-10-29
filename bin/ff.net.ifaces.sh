#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
#################### BEGIN
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##

$SUDO ifconfig enp1s5 0.0.0.0
$SUDO ifconfig enp1s5:1 10.0.0.10/8
$SUDO ifconfig enp1s5:1 10.74.11.1/8

#ifconfig

route -n

################### END
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

