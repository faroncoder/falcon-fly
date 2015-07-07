#!/bin/bash
startgreen=`date +%s`
function stopwatchtime {
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
  exit 0
}

#GITLIST=( "$(find /home/faron/.falcon/scripting -maxdepth 3 -type d -name '.git' -exec dirname {} \; | sed '/\/gits\//d' )" )

GETALLGIT=( $( find "/home/faron/.falcon/scripting/falcon-gits" -maxdepth 1 -type d  -exec basename {} \; | sed '/.git/d' ) )
for p in "${GETALLGIT[@]}";
do
	echo "FALCON: Updating $p"
	cd /home/faron/.falcon/scripting/falcon-gits/$( echo $p )
	CHECKNAME=$( grep 'faroncoder' $PWD/.git/config )
	CHECKEMAIL=$( grep 'faronledger@gmail.com' $PWD/.git/config )
	if [ -z "$CHECKNAME" ];
		then
		git config --global user.name "faroncoder"
	fi
	if [ -z "$CHECKEMAIL" ];
		then
		git config --global user.email faronledger@gmail.com
	fi

	if [ ! -d "/home/faron/.falcon/scripting/falcon-gits/`echo $p`/.git" ];
		then
			echo "git init"
	fi
	CHECKCONF=$( grep 'url' /home/faron/.falcon/scripting/falcon-gits/$( echo $p )/.git/config )
	if [ -z "$CHECKCONF" ];
		then
		git config --global push.default simple
		git remote add origin
		git fetch
	fi
	git remote set-url origin git@github.com:faroncoder/$( echo $p).git
	git remote add origin git@github.com:faroncoder/$( echo $p).git
	git pull
	git status
	git add --all
	git commit -m "auto-committer"
	git push
done

echo "FALCON: Updating falcon-fly"
cd /home/faron/.falcon/scripting/falcon-fly
CHECKNAME=$( grep 'faroncoder' $PWD/.git/config )
	CHECKEMAIL=$( grep 'faronledger@gmail.com' $PWD/.git/config )
	if [ -z "$CHECKNAME" ];
		then
		git config --global user.name "faroncoder"
	fi
	if [ -z "$CHECKEMAIL" ];
		then
		git config --global user.email faronledger@gmail.com
	fi
	git config --global push.default simple
	git remote add origin
	git fetch
	git remote set-url origin git@github.com:faroncoder/falcon-fly.git
	git pull
	git status
	git add --all
	git commit -m "auto-committer"
	git push

# find "/home/faron/.falcon/scripting" -maxdepth 3 ! -path '*/gits/*' -type d -name '.git' > /tmp/x.txt
# 	#for f in "${GITLIST[@]}"; do
# 	#	DRIVE="$( dirname $f )"
# 	sed -i -e '/\/home\/faron\/.falcon\/scripting\/gits/d' /tmp/x.txt
# while read line;
# 	do
# 		DRIVE=$( dirname $line );
# 		cd $DRIVE;
# 		echo  "Updating git in $PWD";
# 		git status;
# 		git add --all;
# 		git commit -m "auto-committing via script";
# 		#git push -u "$( basename $PWD ).git" master;
# 		#git push -u "$( basename $PWD ).git";
# 		git push;
# 	done < /tmp/x.txt
# rm /tmp/x.txt

stopwatchtime
