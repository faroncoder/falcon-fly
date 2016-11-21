#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
openshengine

		gitnewname=`basename $PWD`
		if [[ "$gitnewname" == "scripts" ]]; then
			gitnewname="falcon-fly"
		fi
		if [[ "$gitnewname" == "db" ]]; then
			gitnewname="databasesystem"
		fi
		_send="$CHR182"; _comment="Target: $gitnewname"
		#echo "_stat Target: $gitnewname"
		#confirmgitnew="https://github.com/faroncoder/falcon-$gitnewname.git"
		_FP

		_send="$CHR182"; _comment="`echo -n \"Commit message? \"`"
		_FY
		read COMMIT
	git checkout  2> /dev/null
	# git status; _info echo "status checked" 2> /dev/null
	git status; _send="$CHR182"; _comment="Status checked"
	_FY

	git add -A; _send="$CHR182"; _comment="files checked" 2> /dev/null
	_FY
	git commit -am "`echo $COMMIT`";
	git push -u origin master;
	git pull 2> /dev/null
	_send="$CHR182"; _comment="$b_yellow Updating$clear $gitnewname"
	_FP
	git checkout 2> /dev/null
	_send="$CHR182"; _comment="$b_red Cleaning$clear: local $gitnewname" 2> /dev/null
	git checkout master 2> /dev/null
	_send="$CHR182"; _comment="Checkout $b_yellow local$clear $gitnewname"
	_FG
	git fetch  2> /dev/null
	git pull  2> /dev/null
	git push  2> /dev/null
	_send="$CHR182"; _comment="Checkout $b_yellow remote$clear $gitnewname"
	_FT


	git checkout 2> /dev/null  < /dev/null

	_ok

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.git.updater.sh  [ACTIVE] y

