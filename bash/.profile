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
	if [[ "$EUID" != 0 ]]; then
		LOC="/home"
	else
		LOC=""
	fi
	if [ "$HOME" != "$LOC/$( echo $PWD | cut -d"/" -f 3 )" ]; then
		echo "BOOL is set for false matching"
	else 
		echo "BOOL matches!"
	fi
	#	source ~/.bashrc
fi




