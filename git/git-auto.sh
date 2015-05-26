#!/bin/bash
source /home/faron/.bash_scripts
time
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



#stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
echo "$0 | `/usr/bin/time -f "\t%E real,\t%U user,\t%S sys" -a -o /home/faron/.falcon/logs/scripts.log $0`" exit 0

