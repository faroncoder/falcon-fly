#!/bin/bash

GITLIST=( "$( find /home/faron/.falcon/scripting -maxdepth 2 -type d -name '.git' )" )
LISTCOUNT= echo "${GITLIST[@]}" | wc -l
TOTALCOUNT=0

for f in "${GITLIST[@]}"; do
	cd ~
	echo "GITS: $TOTALCOUNT of $LISTCOUNT"
	echo  "Updating: $f"
	cd $f;
	cd ..
	git status;
	git add --all;
	git commit -m "auto-committing via script";
	git push
	#git push -u "$( basename $PWD ).git";

done


exit 0
