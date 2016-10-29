#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
#if [[ "$1" != "" ]]; then
#################### BEGIN


## grab the function in getting interface name
MEEF=`/usr/local/bin/ff.net.devices`

echo -e "$Fwarn switching $MEEF off"
$SUDO ifconfig $MEEF down

$SUDO ifconfig $MEEF up
echo -e "$Fstat switching $MEEF on"
$SUDO service networking reload
echo -e "$Fok"


################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


