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


	

		echo "node_modules" > .gitignore

		
				touch README.md
				git init
				
	echo "[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote \"origin\"]
	url = git@github.com:faroncoder/falcon-datasystem.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch \"master\"]
	remote = origin
	merge = refs/heads/master

" > $PWD/.git/config

				git config --global user.name "faroncoder"
    			git config --global user.email "faronledger@gmail.com"
				git config --global push.default simple
				git remote add origin git@github.com:faroncoder/falcon-$gitnewname.git
				git commit --amend --reset-author
				git status
				git commit -am "First commit"
				git push --set-upstream origin master
				git push origin master
				ff.git.updater
			fi

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.git.new.sh  [ACTIVE] y

