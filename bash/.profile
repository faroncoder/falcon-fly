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
	
	if [ -f "$HOME/.bashrc" ]; then
		source $HOME/.bashrc
	else
		source $HOME/.bash_backup/.bashrc
	fi
	#export PEPPER_FLASH_VERSION=$(grep '"version":' /opt/google/chrome*/PepperFlash/manifest.json| grep -Po '(?<=version": ")(?:\d|\.)*')
fi
