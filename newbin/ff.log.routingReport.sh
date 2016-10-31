#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

if [[ $USER != 0 ]]; then
	SUDO="sudo "
fi
BASE="/home/users/faron/.falcon/logs/router"
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
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.log.routingReport.sh  [ACTIVE] y

