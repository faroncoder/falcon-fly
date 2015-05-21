#!/bin/bash

#GITLIST=( "$(find /home/faron/.falcon/scripting -maxdepth 3 -type d -name '.git' -exec dirname {} \; | sed '/\/gits\//d' )" )


find /home/faron/.falcon/scripting -maxdepth 3 -type d -name '.git' > ~/x.txt
	#for f in "${GITLIST[@]}"; do
	#	DRIVE="$( dirname $f )"
while read line; do
	DRIVE=$( dirname $line );
	cd $DRIVE;
	echo  "Updating git in $PWD";
	git status;
	git add --all;
	git commit -m "auto-committing via script";
	git push;
	#git push -u "$( basename $PWD ).git";
done < ~/x.txt
rm ~/x.txt

exit 0
