#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;

#################### BEGIN

	openshengine

		gitnewname=$( basename $PWD )
		GITUL="https://github.com/faroncoder/falcon-$gitnewname.git"
		echo "$Fstat URL: $GITUL"
		echo -n "$Fwarn New repository: $gitnewname ... Proceed? (y/n)  "
		read comfirmgit
		

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
				url = git@github.com:faroncoder/falcon-$gitnewname.git
				fetch = +refs/heads/*:refs/remotes/origin/*
		[user]
				name = faroncoder

		" > $PWD/.git/config

		echo "node_modules" > .gitignore


				touch README.md
				git init
				git status
				git commit -am "First commit"
				git remote add origin git@github.com:faroncoder/falcon-$gitnewname.git
				git push --set-upstream origin master
				ff.git.updater
			fi

################### END
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/git/ff.git.new.sh [ACTIVE] y


