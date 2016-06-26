#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#if [[ "$1" != "" ]]; then
#################### BEGIN


if [[ "$EUID" != 0 ]];
	then SUDO="sudo"
fi
opensh_started(){
        PIDOFCHECK=$( pidof ssh-agent | wc -w )
        if [[ "$PIDOFCHECK" -gt 2 ]]; then
                $SUDO kill -15 `pidof ssh-agent` 2> /dev/null
        fi
}

opensh_engine(){
        opensh_started
        echo "Initializing SSH agent..."
        chmod 700 -R ~/.ssh;
        echo "privizating ~/.ssh : done";
        if [[ -f "/home/users/$USER/.ssh/authorized_keys" ]]; then
                chmod 640 /home/users/$USER/.ssh/authorized_keys
        fi
        ssh-agent; 2> /dev/null < /dev/null
        eval $( ssh-agent -s ) > ~/.ssh/environment;
        find -L "/home/users/$USER/.ssh" -type f -name 'id_*' ! -name '*.pub' -$
}

opensh_engine

git config --global push.default simple

GETALLGIT=( $( find /mnt/falcon/scripts -type d -name '.git' -exec dirname {} \;  ) )

for git in "${GETALLGIT[@]}"; do
	cd $git 1> /dev/null
	CKTHISGIT="$( basename $PWD )"
	if [[ "$CKTHISGIT" = 'scripts' ]]; then
		THISGIT="falcon-fly.git"
	else
		THISGIT="$CKTHISGIT.git"
	fi
	git remote set-url origin "git@github.com:faroncoder/$THISGIT"
	git config --global user.name "faroncoder"
	git config --global user.email "faronledger@gmail.com"
	sleep 1
	echo -e "$Finfo updating local git from remote"
	git fetch
	git status
	git add -A
	git commit -a -m "$( hostname )-merge"
	git pull
	echo -e "$Fok git merged"
	sleep 1
	echo -e "$Finfo Updating $THISGIT"
	git status
	git commit -a -m "$( hostname )-update"
	git push
	git remote add origin "git@github.com:faroncoder/$THISGIT"
	git push --set-upstream origin master
	git push -u origin master
	echo -e "$Fok git updated"
	sleep 1
done

#echo -e $Fok"$Fyellow $( basename $0 ) $Foff"

################### END
cd $RETURN 1> /dev/null
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

