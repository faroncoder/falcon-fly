#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
#if [[ "$1" != "" ]]; then
#################### BEGIN

if [[ $USER != 0 ]]; then
	SUDO="sudo "
fi
<<<<<<< HEAD
BASE="/home/users/faron/.falcon/logs/router"
=======
<<<<<<< HEAD
BASE="/home/users/faron/.falcon/logs/router"
=======
BASE="/mnt/falcon/logs/router"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
LOG="$BASE/router.log"
ACCEPT="$BASE/accepted.log"
DROP="$BASE/dropped.log"

echo -e "$Finfo Collecting ACCEPT report"
grep 'ACCEPT' $LOG | sort | uniq  >> $ACCEPT
echo -e "$Fok ACCEPTED report generated"
echo -e "$Finfo Collecting DROP report"
grep 'DROP' $LOG | sort | uniq  >> $DROP
echo -e "$Fok DROPPED report generated"


################### END
#cd $RETURN
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

