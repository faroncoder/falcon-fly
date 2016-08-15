#!/bin/bash
export PATH=$PATH

if [[ "$USER" != "root" ]]; then 
	echo "sudo yourself in, Faron."
	exit 1
fi

if [ ! "$( dpkg -l | grep 'nfs-kernel-server')"  ]; then
        ff.apt.fetch nfs-kernel-server nfs-common
fi

BINPULL="$HOME/falcon/setup/new_setup/vault"
CARDFIND="$( hostname --short | sed 's/f//g' )"
EXP="$BINPULL/exports.txt"
grep "$(hostname --short | sed 's/f//g' )" "$EXP" >> /etc/exports
exportfs


exit 0



