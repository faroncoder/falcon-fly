#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

	openshengine

		gitnewname=`basename $PWD`
		if [[ "$gitnewname" == "scripts" ]]; then
			gitnewname="falcon-fly"
		fi
		if [[ "$gitnewname" == "db" ]]; then
			gitnewname="databasesystem"
		fi

		GITUL="https://github.com/faroncoder/falcon-$gitnewname.git"
		echo "_stat URL: $GITUL"
		echo -n "$_warn New repository: $gitnewname ... Proceed? (y/n)  "
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
			remote = origin
			merge = refs/heads/master

		[remote \"origin\"]
				url = git@github.com:faroncoder/falcon-$gitnewname.git
				fetch = +refs/heads/*:refs/remotes/origin/*
		[user]
				name = faroncoder
				email = faronledger@gmail.com

		" > $PWD/.git/config

		echo "node_modules" > .gitignore

		git config --global push.default matching
		git remote add origin git@github.com:faroncoder/falcon-$gitnewname.git
		
				touch README.md
				git init
				git status
				git commit -am "First commit"
				git push
				ff.git.updater
			fi

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.git.new.sh  [ACTIVE] y

