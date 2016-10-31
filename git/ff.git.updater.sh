#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
openshengine

		gitnewname=$( basename $PWD )
		if [[ "$gitnewname" == "scripts" ]]; then
			gitnewname="falcon-fly"
		fi
		echo "$Fstat Target: $gitnewname"
		#confirmgitnew="https://github.com/faroncoder/falcon-$gitnewname.git"

		echo -n "$Finfo Commit message? "
		read COMMIT
	git checkout  2> /dev/null
	git status; echo "$Finfo status checked" 2> /dev/null
	git add -A; echo "$Finfo files checked" 2> /dev/null
	git commit -am 	"`echo $COMMIT`";
	git push -u origin master;
	git pull 2> /dev/null
	echo "$Fstat $Fyellow Updating$Foff $gitnewname" 2> /dev/null
	git checkout 2> /dev/null
	echo "$Finfo $Fred Cleaning$Foff: local $gitnewname" 2> /dev/null
	git checkout master 2> /dev/null
	echo "$Finfo Checkout: $Fyellow local$Foff $gitnewname"
	git fetch  2> /dev/null
	git pull  2> /dev/null
	git push  2> /dev/null
	echo "$Finfo Checkout: $Fyellow remote$Foff $gitnewname"
	git checkout 2> /dev/null  < /dev/null

	echo "$Fok"


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.git.updater.sh  [ACTIVE] y

