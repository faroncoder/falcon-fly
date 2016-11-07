#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/loader; startTime;
####################START

SRVD=`hostname -s`
SLAVES=""

SLAVES=( `echo "20 6 28"`  )

for VAR in " ${SLAVES[@]}"; do
		NUM=`echo $VAR | sed 's/ //g'`
		SVRER="192.168.1.$NUM"
		rsync -avzh --delete --exclude .git --exclude Sublime   "/home/users/faron/.falcon/scripts"  	"192.168.1.8:/home/users/faron/.falcon/"
		_send="$CHR354"; _comment="Collecting all updated scripts from $SVRER slave-server."
		_FY
done

if [[ "$SRVD" == "f8" ]]; then

		_send="$CHR24"; _comment="We are on master server.  Sync completed for the Master Server."
		_FT
		exit 1
else
		_send="$CHR344"; _comment="Performing the sync."
		_FB
		rsync -avzh --delete --exclude .git --exclude Sublime    "$HOME/.falcon/scripts"  "192.168.1.8:/home/users/faron/.falcon/"
		_send="$CHR24"; _comment="Scripts all sync-ed"
		_FG
		$FALCON/bin/./ff.load.sh
fi


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.sync.sh  [ACTIVE] y

