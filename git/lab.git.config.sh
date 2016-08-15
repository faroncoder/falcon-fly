#!/bin/bash
startgreen=`date +%s`

GITNAME="$( basename $PWD ).git"

if [[ -d "$PWD/.git" ]]; then
	CHECKGIT=$( cat .git/config | wc -l )
	if [[ "$CHECKGIT" = 13 ]]; then
		echo "your git configuration is valid"
		git checkout
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
	else
		GITNAME="$( basename $PWD ).git"
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
	url = git@github.com:faroncoder/$GITNAME
	fetch = +refs/heads/*:refs/remotes/origin/*
[user]
	name = faroncoder
" > $PWD/.git/config
	fi
fi

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

