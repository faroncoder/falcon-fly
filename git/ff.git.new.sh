#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;

#################### BEGIN



		gitnewname=$( basename $PWD )
		echo -n "echo $Finfo Creating new branch $gitnewname.git.  Proceed? "
		read comfirmgit
		confirmgitnew="https://github.com/faroncoder/$gitnewname.git"

		if [ "$comfirmgit" == "y" ]
			then


		echo "
		[core]
			repositoryformatversion = 0
			filemode = true
			bare = false
			logallrefupdates = true
		[branch \"master\"]
		[remote \"origin\"]
				url = git@github.com:faroncoder/falcon-fly.git
				fetch = +refs/heads/*:refs/remotes/origin/*
		[user]
				name = faroncoder

		" > $PWD/.git/config


				touch README.md
				git init
				git add README.md
				git add -A
				git commit -m "first commit"
				git remote add origin
				git push -u --set-upstream origin master
				ff.git.updater
			else
				exit 1
		fi




echo "$Fstat"
echo "$Fno"
echo "$Fwarn"

echo "$Fok"


################### END
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/git/ff.git.new.sh [ACTIVE] y


