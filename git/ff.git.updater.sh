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

	git status; echo "$Finfo status checked"
	git add -A; echo "$Finfo files checked"
	git commit -am 	"`echo $COMMIT`"; 
	git push -u origin master;
	git pull; git checkout; git checkout master; git fetch; git pull; git push; git checkout; 
	
	echo "$Fok"


################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


