#!/bin/bash
if [ ! "$( echo $PATH | grep '/usr/local/bin/' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

ssh-engine(){
	echo "Initializing SSH agent..."
	chmod 700 -R $HOME/.ssh;
	echo "privizating $HOME/.ssh : done";
	if [ -f "$HOME/.ssh/authorized_keys" ]; then
		chmod 600 ~/.ssh/authorized_keys
	fi
	ssh-agent;
	eval $( ssh-agent -s ) > $HOME/.ssh/environment;
	find -L $HOME/.ssh -type f -name 'id_*' ! -name '*.pub' -exec ssh-add {} \;
}

startedSSH(){
	PIDOFCHECK=$( pidof ssh-agent | wc -w )
	if [[ "$PIDOFCHECK" -gt 2 ]]; then
		sudo kill -15 `pidof ssh-agent`
		ssh-engine
	else
		if [ -z $PIDOFCHECK ]; then
			ssh-engine
		fi
	fi
}



startedSSH

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.ssh.engine "
#  echo "example:  ff.ssh.engine  "
#fi
## TALON:
XeF


