#!/bin/bash
if [ ! "$( echo $PATH | grep '/home/faron/.bin/' )" ]; then
	export PATH=$PATH:/home/faron/.bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN
ssh-engine() {
        echo "Initializing SSH agent..."
        chmod -R 700 $HOME/.ssh;
        echo "privizating $HOME/.ssh : done";
        ssh-agent;
        eval $( ssh-agent -s ) > $HOME/.ssh/environment;
        find -L ~/.ssh -type f -name 'id_*' ! -name '*.pub' -exec ssh-add {} \;
}

source $0

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.ssh.engine "
#  echo "example:  ff.ssh.engine  "
#fi
## TALON:
XeF


