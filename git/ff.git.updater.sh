#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
openshengine

		gitnewname=$( basename $PWD )
		if [[ "$gitnewname" == "scripts" ]]; then
			gitnewname="falcon-fly"
		fi
		echo "_stat Target: $gitnewname"
		#confirmgitnew="https://github.com/faroncoder/falcon-$gitnewname.git"

		echo -n "$_info Commit message? "
		read COMMIT
	git checkout  2> /dev/null
	git status; echo "$_info status checked" 2> /dev/null
	git add -A; echo "$_info files checked" 2> /dev/null
	git commit -am 	"`echo $COMMIT`";
	git push -u origin master;
	git pull 2> /dev/null
	echo "_stat $b_yellow Updating$reset $gitnewname" 2> /dev/null
	git checkout 2> /dev/null
	echo "$_info $b_red Cleaning$reset: local $gitnewname" 2> /dev/null
	git checkout master 2> /dev/null
	echo "$_info Checkout: $b_yellow local$reset $gitnewname"
	git fetch  2> /dev/null
	git pull  2> /dev/null
	git push  2> /dev/null
	echo "$_info Checkout: $b_yellow remote$reset $gitnewname"
	git checkout 2> /dev/null  < /dev/null

	echo "${_ok}"


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.git.updater.sh  [ACTIVE] y

