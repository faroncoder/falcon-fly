#!/bin/bash
startgreen=`date +%s`

#GITLIST=( "$(find /home/faron/.falcon/scripting -maxdepth 3 -type d -name '.git' -exec dirname {} \; | sed '/\/gits\//d' )" )


find /home/faron/.falcon/scripting -maxdepth 3 ! -path '*/gits/*' -type d -name '.git' > ~/x.txt
	#for f in "${GITLIST[@]}"; do
	#	DRIVE="$( dirname $f )"
	sed -i -e '/\/home\/faron\/.falcon\/scripting\/gits/d' ~/x.txt
while read line; do
	DRIVE=$( dirname $line );
	cd $DRIVE;
	echo  "Updating git in $PWD";
	git status;
	git add --all;
	git commit -m "auto-committing via script";
	#git push -u "$( basename $PWD ).git" master;
	#git push -u "$( basename $PWD ).git";
	git push;
done < ~/x.txt
#rm ~/x.txt

trap 'time' 5

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
