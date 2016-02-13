#!/bin/bash
HERE=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then
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
        chmod 700 -R ~/.ssh;
        echo "privizating ~/.ssh : done";
        if [ -f "~/.ssh/authorized_keys" ]; then
                chmod 600 ~/.ssh/authorized_keys
        fi
        ssh-agent -D;
        eval $( ssh-agent -s ) > ~/.ssh/environment;
        find -L ~/.ssh -type f -name 'id_*' ! -name '*.pub' -exec ssh-add {} \;
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
cd $HERE
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.ssh-engine "
#  echo "example:  ff.ssh-engine  "
#fi
## TALON:
XeF


