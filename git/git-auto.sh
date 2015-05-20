#!/bin/bash

GITLIST=( "$( find /home/faron/.falcon/scripting -maxdepth 2 -type d -name '.git' )" )

for f in "${GITLIST[@]}"; do
	echo  "Updating: $f"
	cd $( echo $f | sed 's/\/.git//g' )
	git status;
	git add --all;
	git commit -m "auto-committing via script" -a;
	git push;
	#git push -u "$( basename $PWD ).git";

done


exit 0
