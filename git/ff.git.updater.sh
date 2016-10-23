#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN


		gitnewname=$( basename $PWD )
		if [[ "$gitnewname" == "scripts" ]]; then
			gitnewname="falcon"
		fi
		echo "$Finfo Target: $gitnewname"
		#confirmgitnew="https://github.com/faroncoder/falcon-$gitnewname.git"

		echo -e -n "$Fstatus Commit message? "
		read COMMIT
	git checkout 
	git status; echo "$Finfo status checked"
	git add -A; echo "$Finfo files checked"
	git commit -am 	"`echo $COMMIT`"; 
	git push -u origin master;
	git pull 1> /dev/null 2> /dev/null  < /dev/null
	echo "$Fstat Updating: $gitnewname"
	git checkout 1> /dev/null 2> /dev/null  < /dev/null
	echo "$Finfo Cleaning: local $gitnewname"
	git checkout master 1> /dev/null 2> /dev/null  < /dev/null
	echo "$Finfo Checkout: $Fyellow local$Foff $gitnewname"
	git fetch  1> /dev/null 2> /dev/null  < /dev/null
	git pull  1> /dev/null 2> /dev/null  < /dev/null
	git push  1> /dev/null 2> /dev/null  < /dev/null
	echo "$Finfo Checkout: $Fyellow remote$Foff $gitnewname"
	git checkout 2> /dev/null  < /dev/null
	
	echo "$Fok"


################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


