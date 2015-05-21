#!/bin/bash
if [[ "$EUID" == 0 ]] ; then
	apt-get install -y nfs-kernel-server nfs-common cifs-utils libnss-winbind winbind

	## Checking for WINS installation
	## If not have it - install it.
if [ -z "$( grep 'wins' /etc/nsswitch.conf )" ]; then
		sed -i -e 's/ dns / wins dns /g' /etc/nsswitch.conf;
	else
		## dismissing as wins is already installed
		echo "you already have wins installed";
fi


## finding out which is server or client and which patch packages to configure
if [[ "$( hostname )" == "f10" ]]; then

## if it is server then configure it.
## checking if exports is set up
if [ -z "$( grep '192.168.1.10' /etc/exports )" ]; then
	# if not have it - install it.
	echo "
/home/faron/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)
/home/faron/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)
/home/faron/.falcon 192.168.1.10/24(rw,sync,no_subtree_check)
" >> /etc/exports
	else
		## dismissing as exports is already set up
		echo "you already have exports set up"
fi

else
	## if it is a client then reconfigure
	echo "
192.168.1.10/falcon /home/faron/.falcon  cifs  credentials=/home/faron/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0

192.168.1.10/output /media/output  cifs  credentials=/home/faron/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0

192.168.1.10/mkv /media/mkv  cifs  credentials=/home/faron/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0
" >> /etc/fstab

	## adding credits for NFS
> /home/faron/.smbcredentials
while read line; do
		echo $line >> /home/faron/.smbcredentials
	done < /home/faron/.falcon/configs/configs-private/cifs_access.txt



fi



else
	echo "Faron - su yourself in!"
	exit 0
fi

exit 0

