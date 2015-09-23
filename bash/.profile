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
	find /home/faron/.falcon/scripts/falcon-fly/bash -maxdepth 1 ! -name '.profile' -name '.bash_*'  ! -name '.bash_history' ! -name '.bash_logout' -exec ln -s {} \; > /dev/null 2>&1
	#GETALL=( $( find ~/ -maxdepth 1 -type l -name '.*' ! -name '.bash_history' ! -name '.*help*' ! -name '.bash_logout' ! -name '.profile' ) )
	#for z in "${GETALL[@]}"; do
		source $z
#	done

	#ssh-check
	source ~/.bashrc
fi




