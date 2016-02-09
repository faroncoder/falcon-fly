#!/bin/bash
HERE=$PWD
startgreen=`date +%s`
stopwatchtime(){
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
  exit 0
}

export PATH=$PATH
ff.ssh-engine

git config --global push.default simple



#GITLIST=( "$(find /home/faron/.falcon/scripting -maxdepth 3 -type d -name '.git' -exec dirname {} \; | sed '/\/gits\//d' )" )

#GETALLGIT=( $( find /home/faron/.falcon/scripts -type d -name '.git' -exec dirname {} \;  ) )
GETALLGIT=$( find /home/faron/.falcon/scripts -type d -name '.git' -exec dirname {} \;  )

cd $GETALLGIT 2> /dev/null

#CHECKNAME=$( grep 'faroncoder' $PWD/.git/config )
#CHECKEMAIL=$( grep 'faronledger@gmail.com' $PWD/.git/config )

#for p in "${GETALLGIT[@]}";
#do
#	cd $p 2> /dev/null
	CKTHISGIT="$( basename $GETALLGIT )"
	if [[ "$CKTHISGIT" = 'scripts' ]]; then
		THISGIT="falcon-fly.git"
	fi
	git remote set-url origin "git@github.com:faroncoder/$THISGIT"
	git config --global user.name "faroncoder"
	git config --global user.email "faronledger@gmail.com"
	sleep 1
	echo "FALCON: Updating $THISGIT"
	sleep 1
	# if [ ! "$CHECKNAME" ]; then
	# 	git config --global user.name "faroncoder"
	# fi
	# if [ ! "$CHECKEMAIL" ]; then
	# 	git config --global user.email faronledger@gmail.com
	# fi

	# if [ ! -d "/home/faron/.falcon/scripting/home/faron/.falcon-gits/`echo $p`/.git" ]; then
	# 		git init
	# fi
	# CHECKCONF=$( grep 'url' /home/faron/.falcon/scripting/home/faron/.falcon-gits/$( echo $p )/.git/config )
	# if [ -z "$CHECKCONF" ];
		# then
		#git config --global push.default simple

	#fi
	git remote set-url origin "git@github.com:faroncoder/$THISGIT"
	git fetch
	git pull
	git status
	git add --all
	git commit -a -m "auto-$( hostname )-$( date )"
	git push
#done

# echo "FALCON: Updating/home/faron/.falcon-fly"
# cd /home/faron/.falcon/scripts
# CHECKNAME=$( grep 'faroncoder' $PWD/.git/config )
# 	CHECKEMAIL=$( grep 'faronledger@gmail.com' $PWD/.git/config )
# 	if [ -z "$CHECKNAME" ];
# 		then
# 		git config --global user.name "faroncoder"
# 	fi
# 	if [ -z "$CHECKEMAIL" ];
# 		then
# 		git config --global user.email faronledger@gmail.com
# 	fi
# 	#git config --global push.default simple
# 	#git remote add origin
# 	git fetch
# 	#git remote set-url origin git@github.com:faroncoder/home/faron/.falcon-fly.git
# 	git pull
# 	git status
# 	git add --all
# 	git commit -m "auto-committer"
# 	git push

# # find "/home/faron/.falcon/scripting" -maxdepth 3 ! -path '*/gits/*' -type d -name '.git' > /tmp/x.txt
# 	#for f in "${GITLIST[@]}"; do
# 	#	DRIVE="$( dirname $f )"
# 	sed -i -e '/\/home\/faron\//home/faron/.falcon\/scripting\/gits/d' /tmp/x.txt
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
cd $HERE
stopwatchtime
exit 0


