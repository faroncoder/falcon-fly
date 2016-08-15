#!/bin/bash
startgreen=`date +%s`
		gitnewname=$( basename $PWD )
		echo -n "Creating new branch $gitnewname.git.  Proceed? "
		read comfirmgit
		confirmgitnew="https://github.com/faroncoder/$gitnewname.git"

		if [ "$comfirmgit" == "y" ]
			then
				touch README.md
				git init
				git add README.md
				git add -A
				git commit -m "first commit"
				git remote add origin
				git push -u origin master $confirmgitnew
			else
				exit 1
		fi
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
