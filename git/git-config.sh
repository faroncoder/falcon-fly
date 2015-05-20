#!/bin/bash

GITNAME="$( basename $PWD ).git"

if [[ -d "$PWD/.git" ]]; then
	CHECKGIT=$( cat .git/config | wc -l )
	if [[ "$CHECKGIT" < 16 ]]; then
		echo "your git configuration is valid"
	else
		GITNAME="$( basename $PWD )"
		echo "
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[branch \"master\"]
	remote = $GITNAME
	merge = refs/heads/master
[remote \"origin\"]
	fetch = +refs/heads/*:refs/remotes/origin/*
	url = git@github.com:faroncoder/$GITNAME.git
[user]
	name = faroncoder
" > $PWD/.git/config
	fi
fi

exit 0

