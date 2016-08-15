#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#if [[ "$1" != "" ]]; then
#################### BEGIN

<<<<<<< HEAD
=======
<<<<<<< HEAD
loadSudo
openshengine


GETALLGIT=( $( find /home/users/faron/.falcon/scripts -type d -name '.git' -exec dirname {} \;  ) )

setupAccess(){
	git config --global push.default simple
	git remote set-url origin "git@github.com:faroncoder/$THISGIT"
	git config --global user.name "faroncoder"
	git config --global user.email "faronledger@gmail.com"
	git push --set-upstream origin master
}

=======
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347

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
        eval ` ssh-agent -s `  > ~/.ssh/environment;
        find /home/users/$USER/.ssh -type f -name 'id_*' ! -name '*.pub' -exec ssh-add {} \;
}

opensh_engine

git config --global push.default simple

<<<<<<< HEAD
GETALLGIT=( $( find /home/users/faron/.falcon/scripts -type d -name '.git' -exec dirname {} \;  ) )

=======
GETALLGIT=( $( find /mnt/falcon/scripts -type d -name '.git' -exec dirname {} \;  ) )

>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
for git in "${GETALLGIT[@]}"; do
	cd $git 1> /dev/null
	CKTHISGIT="$( basename $PWD )"
	if [[ "$CKTHISGIT" = 'scripts' ]]; then
		THISGIT="falcon-fly.git"
	else
		THISGIT="$CKTHISGIT.git"
	fi

<<<<<<< HEAD
=======
<<<<<<< HEAD
echo -e "$Finfo updating local git from remote"
	git pull
	git status
#	git checkout
	echo -e "$Fok git merged"
	git add -A
	git commit -a -m "`date` "
	# git push --set-upstream origin master
	#git push -u origin master 1> /dev/null
	echo -e "$Fok git updated"
	logger "$( hostname -s ) $0  :: $THISGIT updated @ github.com"
=======
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	git remote set-url origin "git@github.com:faroncoder/$THISGIT" 1> /dev/null
	git config --global user.name "faroncoder" 1> /dev/null
	git config --global user.email "faronledger@gmail.com" 1> /dev/null
	sleep 1

echo -e "$Finfo updating local git from remote"


	git status
	git add -A
	git commit -a -m "$( hostname )-merge"
	git pull git@github.com:faroncoder/$THISGIT master
	git merge
	git checkout -b $THISGIT-working
	git fetch
	echo -e "$Fok git merged"
	sleep 1

	echo -e "$Finfo Updating $THISGIT"
	git fetch
	git status
	git merge
	git commit -a -m "$( hostname -s )-update"
	git push --set-upstream origin master 1> /dev/null
	git push -u origin master 1> /dev/null
	echo -e "$Fok git updated"
	sleep 1

	logger "$THISGIT updated with Github"
<<<<<<< HEAD
=======
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347

done
#echo -e $Fok"$Fyellow $( basename $0 ) $Foff"

################### END
<<<<<<< HEAD
cd $RETURN 1> /dev/null
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
=======
<<<<<<< HEAD
#cd $RETURN 1> /dev/null;
else echo -e "$Finfo Arg 1=$Fyellow empty $Foff "; fi
=======
cd $RETURN 1> /dev/null
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

