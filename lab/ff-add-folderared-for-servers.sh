#!/bin/bash
startgreen=`date +%s`
if [[ ! "$EUID" = 0 ]]; then
		echo "su yourself in first, Faron"
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
fi
apt-get install -y nfs-kernel-server nfs-common cifs-utils libnss-winbind winbind

		## Checking for WINS installation
		## If not have it - install it.
if [[ -z "$( grep 'wins' /etc/nsswitch.conf )" ]]; then
		sed -i -e 's/\ dns\ /\ wins\ dns\ /g' /etc/nsswitch.conf
		echo "etc/nsswitch.conf :: edited"
	else
		## dismissing as wins is already installed
		echo "you already have wins installed";
		grep 'wins' /etc/nsswitch.conf
fi
		## finding out which is server or client and which patch packages to configure
if [[ "$( hostname )" == "f10" ]]; then
		## if it is server then configure it.
		## checking if exports is set up
		if [[ -z "$( grep '192.168.1.10' /etc/exports )" ]]; then
			# if not have it - install it.
	 		echo "/home/users/$USER/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)
			/home/users/$USER/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)
			/mnt/falcon 192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
		else
			echo "all of export folders of your preference is already set"
		fi
		if [[ -z "$( grep 'output' /etc/exports )" ]]; then
			echo "nope you dont have output"
			echo "/home/users/$USER/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
			echo "now you have output"
		else
			echo "/output for /etc/exports is already set"
		fi
		if [[ -z "$( grep 'mkv' /etc/exports )" ]]; then
			echo "nope you dont have mkv"
			echo "/home/users/$USER/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
			echo "now you have mkv"
		else
			echo "/mkv for /etc/exports is already set"
		fi
		if [[ -z "$( grep '/mnt/falcon' /etc/exports )" ]]; then
			echo "nope you dont have/mnt/falcon"
			echo "/mnt/falcon  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
			echo "now you have/mnt/falcon"
		else
			echo "/mnt/falcon for /etc/exports is already set"
		fi
else
	## if it is a client then reconfigure
	if [[ ! "$( grep /mnt/falcon' /etc/fstab )" ]]; then
		echo "nope you dont have /mnt/falcon' in fstab"
		echo "//192.168.1.10/mnt/falcon /mnt/falcon  cifs  credentials=/home/users/$USER/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
		echo "/mnt/falcon for /etc/fstab configured"
	else
		echo "/mnt/falcon for /etc/fstab is already set"
	fi
	if [[ ! "$( grep 'output' /etc/fstab )" ]]; then
		echo "nope you dont have 'output' in fstab"
		echo "//192.168.1.10/output /home/users/$USER/var/Streamings/files/engine/factory-mp4/output  cifs  credentials=/home/users/$USER/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
		echo "/output for /etc/fstab configured"

	else
		echo "/output for /etc/fstab is already set"
	fi
	if [[ ! "$( grep 'mkv' /etc/fstab )" ]]; then
		echo "nope you dont have 'mkv' in fstab"
		echo "//192.168.1.10/mkv /home/users/$USER/var/Streamings/files/engine/factory-mp4/mkv  cifs  credentials=/home/users/$USER/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
		echo "/mkv for /etc/fstab configured"
	else
		echo "/mkv for /etc/fstab is already set"
	fi
	if [[ ! -f "/home/users/$USER/.smbcredentials" ]]; then
	## adding credits for NFS
		echo "adding creditals"
		cp /mnt/falcon/configs/configs-private/cifs_access.txt  /home/users/$USER/.smbcredentials
		echo "creditals creation completed"
	else
		echo "creditals already is in the system"
	fi
fi

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
