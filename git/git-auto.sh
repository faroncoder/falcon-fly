#!/bin/bash

GITLIST=( "$(find /home/faron/.falcon/scripting -maxdepth 3 -type d -name '.git' | sed '/\/gits\/*/d' )" )

	for f in "${GITLIST[@]}"; do
		DRIVE="$( cd ../$f )"
	cd $( dirname $f )
	echo  "Updating git"
	git status;
	git add --all;
	git commit -m "auto-committing via script";
	git push
	git checkout
	#git push -u "$( basename $PWD ).git";
done

exit 0
