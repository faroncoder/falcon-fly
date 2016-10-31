#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

#GITLIST=( "$(find /home/faron/.falcon/scripting -maxdepth 3 -type d -name '.git' -exec dirname {} \; | sed '/\/gits\//d' )" )


find /home/faron/.falcon/scripting -maxdepth 3 ! -path '*/gits/*' -type d -name '.git' > $HOMEx.txt
	#for f in "${GITLIST[@]}"; do
	#	DRIVE="$( dirname $f )"
	sed -i -e '/\/home\/faron\//home/faron/.falcon\/scripting\/gits/d' $HOMEx.txt
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
done < $HOMEx.txt
#rm $HOMEx.txt




#echo `trap times $ EXIT` >> /home/faron/.falcon/logs/scripts.log
#echo "$0 | `/usr/bin//time -f "\t%E real,\t%U user,\t%S sys" -a -o /home/faron/.falcon/logs/scripts.log $0`" exit 0


#ret=$?; printf "`times`" >> /home/faron/.falcon/logs/scripts.log; exit "$ret"; exit 0

#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] git-auto.sh  [ACTIVE] y

