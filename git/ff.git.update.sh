
#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; fcok="[$fcg OK $fco]"; fcer="[$fcr ERR $fco]";
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [[ "$1" != "" ]]; then
#################### BEGIN
opensh_engine(){
        echo "Initializing SSH agent..."
        chmod 700 -R ~/.ssh;
        echo "privizating ~/.ssh : done";
        if [ -f "~/.ssh/authorized_keys" ]; then
                chmod 640 ~/.ssh/authorized_keys
        fi
        ssh-agent;
        eval $( ssh-agent -s ) > ~/.ssh/environment;
        find -L "$HOME/.ssh" -type f -name 'id_*' ! -name '*.pub' -exec ssh-add {} \;
}
opensh_started(){
        PIDOFCHECK=$( pidof ssh-agent | wc -w )
        if [[ "$PIDOFCHECK" -gt 2 ]]; then
                sudo kill -15 `pidof ssh-agent`
                opensh_engine
        else
                if [[ "$PIDOFCHECK" == "" ]]; then
                        opensh_engine
                fi
        fi
}

opensh_started
git config --global push.default simple
GETALLGIT=( $( find /home/faron/.falcon/scripts -type d -name '.git' -exec dirname {} \;  ) )

for git in "${GETALLGIT[@]}"; do 
	cd $git 2> /dev/null
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
	echo "FALCON: Updating $THISGIT"
	sleep 1
	git fetch
	git pull
	git commit -a -m "$( hostname )-merge" 
	git status
	git add -A
	git commit -a -m "$( hostname )-update"
	git push
	echo -e $fcok
done
cd $RETURN
## else echo -e "$fcer NADA =$fcy no gits $fco"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

