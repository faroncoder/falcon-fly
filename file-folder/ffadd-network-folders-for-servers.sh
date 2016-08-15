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
<<<<<<< HEAD
		 		echo "/home/users/$USER/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)
				/home/users/$USER/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)
				/home/users/faron/.falcon 192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
=======
<<<<<<< HEAD
		 		echo "/home/faron/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)
				/home/faron/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)
				/home/faron/.falcon 192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
=======
		 		echo "/home/users/$USER/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)
				/home/users/$USER/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)
<<<<<<< HEAD
				/home/users/faron/.falcon 192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
=======
				/mnt/falcon 192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
			else
				echo "all of export folders of your preference is already set"
			fi
			if [[ ! "$( grep 'output' /etc/exports )" ]]; then
				echo "nope you dont have output"
<<<<<<< HEAD
				echo "/home/users/$USER/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
=======
				echo "/home/faron/var/Streamings/files/factory-mp4/output  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
				echo "now you have output"
			else
				echo "/output for /etc/exports is already set"
			fi
			if [[ ! "$( grep 'mkv' /etc/exports )" ]]; then
				echo "nope you dont have mkv"
<<<<<<< HEAD
				echo "/home/users/$USER/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
=======
				echo "/home/faron/var/Streamings/files/factory-mp4/mkv  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
				echo "now you have mkv"
			else
				echo "/mkv for /etc/exports is already set"
			fi
<<<<<<< HEAD
=======
<<<<<<< HEAD
			if [[ ! "$( grep '.falcon' /etc/exports )" ]]; then
				echo "nope you dont have falcon"
				echo "/home/faron/.falcon  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
				echo "now you have falcon"
			else
				echo "/falcon for /etc/exports is already set"
=======
<<<<<<< HEAD
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
			if [[ ! "$( grep '/home/users/faron/.falcon' /etc/exports )" ]]; then
				echo "nope you dont have/home/users/faron/.falcon"
				echo "/home/users/faron/.falcon  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
				echo "now you have/home/users/faron/.falcon"
			else
				echo "/home/users/faron/.falcon for /etc/exports is already set"
<<<<<<< HEAD
=======
=======
			if [[ ! "$( grep '/mnt/falcon' /etc/exports )" ]]; then
				echo "nope you dont have/mnt/falcon"
				echo "/mnt/falcon  192.168.1.10/24(rw,sync,no_subtree_check)" >> /etc/exports
				echo "now you have/mnt/falcon"
			else
				echo "/mnt/falcon for /etc/exports is already set"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
			fi
				
		else
			## if it is a client then reconfigure
<<<<<<< HEAD
			if [[ -z "$( grep /home/users/faron/.falcon' /etc/fstab )" ]]; then
				echo "//192.168.1.10/home/users/faron/.falcon /home/users/faron/.falcon  cifs  credentials=/home/users/$USER/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
			fi
			if [[ -z "$( grep 'output' /etc/fstab )" ]]; then
				echo "//192.168.1.10/output /home/users/$USER/var/Streamings/files/engine/factory-mp4/output  cifs  credentials=/home/users/$USER/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
			fi
			if [[ -z "$( grep 'mkv' /etc/fstab )" ]]; then
				echo "//192.168.1.10/mkv /home/users/$USER/var/Streamings/files/engine/factory-mp4/mkv  cifs  credentials=/home/users/$USER/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
			fi
			if [[ ! -f "/home/users/$USER/.smbcredentials" ]]; then
			## adding credits for NFS
			cp /home/users/faron/.falcon/configs/configs-private/cifs_access.txt  /home/users/$USER/.smbcredentials
=======
<<<<<<< HEAD
			if [[ -z "$( grep 'falcon' /etc/fstab )" ]]; then
				echo "//192.168.1.10/falcon /home/faron/.falcon  cifs  credentials=/home/faron/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
=======
<<<<<<< HEAD
			if [[ -z "$( grep /home/users/faron/.falcon' /etc/fstab )" ]]; then
				echo "//192.168.1.10/home/users/faron/.falcon /home/users/faron/.falcon  cifs  credentials=/home/users/$USER/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
=======
			if [[ -z "$( grep /mnt/falcon' /etc/fstab )" ]]; then
				echo "//192.168.1.10/mnt/falcon /mnt/falcon  cifs  credentials=/home/users/$USER/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
			fi
			if [[ -z "$( grep 'output' /etc/fstab )" ]]; then
				echo "//192.168.1.10/output /home/faron/var/Streamings/files/engine/factory-mp4/output  cifs  credentials=/home/faron/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
			fi
			if [[ -z "$( grep 'mkv' /etc/fstab )" ]]; then
				echo "//192.168.1.10/mkv /home/faron/var/Streamings/files/engine/factory-mp4/mkv  cifs  credentials=/home/faron/.smbcredentials,iocharset=utf8,gid=1004,uid=1004,file_mode=0777,dir_mode=0777  0 0" >> /etc/fstab
			fi
			if [[ ! -f "/home/faron/.smbcredentials" ]]; then
			## adding credits for NFS
<<<<<<< HEAD
			cp /home/faron/.falcon/configs/configs-private/cifs_access.txt  /home/faron/.smbcredentials
=======
<<<<<<< HEAD
			cp /home/users/faron/.falcon/configs/configs-private/cifs_access.txt  /home/users/$USER/.smbcredentials
=======
			cp /mnt/falcon/configs/configs-private/cifs_access.txt  /home/users/$USER/.smbcredentials
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
			fi
		fi
fi
exit 0

