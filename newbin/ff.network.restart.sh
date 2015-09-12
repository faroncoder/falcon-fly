#!/bin/bash
SUDO=''
if [ "$EUID" != 0 ]; then
	SUDO='sudo'
fi
GETME=( lo eth0 eth1 )

restarterPool(){

	$SUDO ifconfig $i up;
	$SUDO ifconfig $i down;
	$SUDO service network-manager restart;
	$SUDO service networking restart;
}


for i in "${GETME[@]}";
	do
		restarterPool
	done



exit 0
