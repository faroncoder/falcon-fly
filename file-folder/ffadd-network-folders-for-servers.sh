#!/bin/bash
if [[ ! "$EUID" = 0 ]]; then
		echo "su yourself in first, Faron"
		exit 0
	else
		apt-get install -y nfs-kernel-server nfs-common cifs-utils libnss-winbind winbind

		## Checking for WINS installation
		## If not have it - install it.
		if [[ -z "$( grep 'wins' /etc/nsswitch.conf )" ]]; then
			sed -i -e 's/\ dns\ /\ wins\ dns\ /g' /etc/nsswitch.conf
		else
			## dismissing as wins is already installed
			echo "you already have wins installed";
		fi
		## finding out which is server or client and which patch packages to configure
		if [[ "$( hostname )" == "f10" ]]; then
		## if it is server then configure it.
		## checking if exports is set up
			if [[ ! "$( grep '192.168.1.10' /etc/exports )" = 3 ]]; then
				# if not have it - install it.
		 		echo "/home/faron/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)
				/home/faron/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)
				/home/faron/.falcon 192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
			else
				echo "all of export folders of your preference is already set"
			fi
			if [[ ! "$( grep 'output' /etc/exports )" ]]; then
				echo "nope you dont have output"
				echo "/home/faron/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
				echo "now you have output"
			else
				echo "/output for /etc/exports is already set"
			fi
			if [[ ! "$( grep 'mkv' /etc/exports )" ]]; then
				echo "nope you dont have mkv"
				echo "/home/faron/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
				echo "now you have mkv"
			else
				echo "/mkv for /etc/exports is already set"
			fi
			if [[ ! "$( grep '.falcon' /etc/exports )" ]]; then
				echo "nope you dont have falcon"
				echo "/home/faron/.falcon  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
				echo "now you have falcon"
			else
				echo "/falcon for /etc/exports is already set"
			fi
				
		else
			## if it is a client then reconfigure
			if [[ -z "$( grep 'falcon' /etc/fstab )" ]]; then
				echo "//192.168.1.10/falcon /home/faron/.falcon  cifs  credentials=/home/faron/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
			fi
			if [[ -z "$( grep 'output' /etc/fstab )" ]]; then
				echo "//192.168.1.10/output /home/faron/var/Streamings/files/engine/factory-mp4/output  cifs  credentials=/home/faron/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
			fi
			if [[ -z "$( grep 'mkv' /etc/fstab )" ]]; then
				echo "//192.168.1.10/mkv /home/faron/var/Streamings/files/engine/factory-mp4/mkv  cifs  credentials=/home/faron/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
			fi
			if [[ ! -f "/home/faron/.smbcredentials" ]]; then
			## adding credits for NFS
			cp /home/faron/.falcon/configs/configs-private/cifs_access.txt  /home/faron/.smbcredentials
			fi
		fi
fi
exit 0

