#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##
AliasName=$1
CMD=`awk '{$1=""; print $0 }'
if [[ "$AliasName" == "" ]]; then
	echo -e -n "${_stat} alias name ? ";
	read AliasName
fi
if [[ "$CMD" == "" ]]; then
	echo -e -n "${_stat} command ? ";
	read CMD
fi
#echo -e ${_ok}"$Fyellow $( basename $0 ) $Foff"
echo "alias $AliasName=\"$CMD\"" > source /usr/local/lib/faron_falcon/alias
echo -e ${_ok}
source $HOME/.bashrc

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.alias.add.sh  [ACTIVE] y

