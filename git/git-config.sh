#!/bin/bash

GITNAME="$( basename $PWD ).git"

if [[ -d "$PWD/.git" ]]; then
	CHECKGIT=$( cat .git/config | wc -l )
	if [[ "$CHECKGIT" == 16 ]]; then
		echo "your git configuration is valid"
		exit 0
	else
		echo "
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote \/"origin\/"]
	url = git@github.com:faroncoder/$GITNAME
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch \/"master\/"]
	remote = origin
	merge = refs/heads/master
[user]
	name = faroncoder
[remote \/"$GITNAME\/"]
	url = git@github:/faroncoder/$GITNAME
	fetch = +refs/heads/*:refs/remotes/$GITNAME/*
" > $PWD/.git/config
fi
fi


exit 0

