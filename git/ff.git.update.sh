#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#if [[ "$1" != "" ]]; then
#################### BEGIN

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

for git in "${GETALLGIT[@]}"; do
	cd $git 1> /dev/null
	CKTHISGIT="$( basename $PWD )"
	if [[ "$CKTHISGIT" = 'scripts' ]]; then
		THISGIT="falcon-fly.git"
	else
		THISGIT="$CKTHISGIT.git"
	fi

echo -e "$Finfo updating local git from remote"
	git pull
	git status
#	git checkout
	echo -e "$Fok $THISGIT updated on local from remote"
	git add -A
	git commit -a -m "`date` "
	# git push --set-upstream origin master
	git push
	echo -e "$Fok git updated"
	logger "$( hostname -s ) $0  :: $THISGIT updated @ github.com"

done
#echo -e $Fok"$Fyellow $( basename $0 ) $Foff"

################### END
#cd $RETURN 1> /dev/null;
else echo -e "$Finfo Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

