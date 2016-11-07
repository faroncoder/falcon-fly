#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
if [[ $USER != 0 ]]; then
	SUDO="sudo "
fi
$SUDO subl /etc/network/interfaces
$SUDO subl /etc/dhcp/dhclient.conf
$SUDO subl /etc/hosts
$SUDO subl /etc/hostname
$SUDO subl /etc/network/if-up.d/ff.net.ifaces
echo -e _ok

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.edit.ifconfig.sh  [ACTIVE] y

