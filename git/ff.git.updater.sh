#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN


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
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


