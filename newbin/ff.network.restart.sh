#!/bin/bash
GETME=( `cat /etc/network/interfaces | awk '{print $2}' | uniq | tr '\n' ' '` )
if [[ "$EUID" != 0 ]]; then
	SUDO="sudo"
fi
for appget in "${GETME[@]}";
	do
		$SUDO ifconfig $appget down
		$SUDO ifconfig $appget up
	done
$SUDO service networking restart
$SUOD service network-manager restart

exit 0
