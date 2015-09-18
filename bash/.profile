# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 002

# if running bash
if [ -n "$BASH_VERSION" ]; then
	if [ ! -d $HOME/.falcon ]; then
		ln -s /home/$USER/.falcon ~/.falcon
	fi
	if [ ! -d /home/$USER/.ssh ]; then
		mkdir ~/.ssh
	fi
	DIRS=( .bin .ssh  )
	for checkbin in "${DIRS[@]}"; do
		if [ "$EUID" != 0 ]; then
			if [ ! -d /root/$checkbin ]; then
				mkdir /root/$checkbin -p 2>/dev/null
			fi
		else
			if [ ! -d /home/$USER/$checkbin ]; then
				mkdir /home/$USER/$checkbin -p 2>/dev/null

			fi
		fi
	done
	LOADER=( `find /home/faron/.falcon/bash -maxdepth 1 -type f ! -type d -exec basename {} \; ` )
	for inject in "${LOADER[@]}";
		do
			if [ ! -f /home/$USER/$inject ]; then
				ln -s /home/faron/.falcon/bash/$inject ~/$inject 2>/dev/null
			fi
		done
		source ~/.bashrc
fi




