#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
$SUDO /bin/rm /var/cache/apt/archives/lock 2> /dev/null
$SUDO /bin/rm /var/lib/dpkg/lock  2> /dev/null
$SUDO dpkg --configure -a  2> /dev/null

SERVER=`hostname -s`
if [[ "$SERVER" == "f6" ]]; then
	echo "${_stat} special update for $SERVER"
	$SUDO apt-get update
else
	$SUDO apt-get dist-upgrade -y --force-yes 2> /dev/null
	$SUDO apt-get autoremove -y --force-yes 2> /dev/null
	$SUDO apt-get autoclean -y --force-yes 2> /dev/null
	$SUDO apt-get clean -y --force-yes 2> /dev/null
	$SUDO apt-get update -y --force-yes 2> /dev/null
fi

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.update.sh  [ACTIVE] y

