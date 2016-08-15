#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
#if [[ "$1" != "" ]]; then
#################### BEGIN
if [[ $USER != 0 ]]; then
	SUDO="sudo "
fi
$SUDO subl /etc/network/interfaces
$SUDO subl /etc/dhcp/dhclient.conf
$SUDO subl /etc/hosts
$SUDO subl /etc/hostname
<<<<<<< HEAD
$SUDO subl /etc/network/if-up.d/ff.net.ifaces
=======

>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
echo -e $Fok

################### END
#cd $RETURN
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

