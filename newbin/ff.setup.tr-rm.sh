#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

if [[ "$EUID" == "0" ]];
	then
	apt-get build-dep trash-cli
	apt-get install trash-cli
	mv /bin/rm /bin/rm_disable
	ln -s /usr/bin/trash-put /bin/rm
	echo "command 'rm' has been tweaked for safety"
else
	echo "You have to sudo in for this!"
	exit 1
fi


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.setup.tr-rm.sh  [ACTIVE] y

