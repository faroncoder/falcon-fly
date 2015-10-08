#!/bin/bash
source /home/faron/.bash_scripts
startgreen=`date +%s`

#GITLIST=( "$(find ~/.falcon/scripting -maxdepth 3 -type d -name '.git' -exec dirname {} \; | sed '/\/gits\//d' )" )


find ~/.falcon/scripting -maxdepth 3 ! -path '*/gits/*' -type d -name '.git' > ~/x.txt
	#for f in "${GITLIST[@]}"; do
	#	DRIVE="$( dirname $f )"
	sed -i -e '/\/home\/faron\/~/.falcon\/scripting\/gits/d' ~/x.txt
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




#echo `trap times $ EXIT` >> ~/.falcon/logs/scripts.log
#echo "$0 | `/usr/bin//time -f "\t%E real,\t%U user,\t%S sys" -a -o ~/.falcon/logs/scripts.log $0`" exit 0


#ret=$?; printf "`times`" >> ~/.falcon/logs/scripts.log; exit "$ret"; exit 0

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

