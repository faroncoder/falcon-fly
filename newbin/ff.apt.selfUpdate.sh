#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
#if [[ "$1" != "" ]]; then
#################### BEGIN

cd /home/users/$USER 1> /dev/null

if [[ ! -f updateServer ]]; then exit 0; else

while read line
	do
		ff.apt.fetch $line 1&2> /dev/null
		logger "FALCON: Apt-get installed $line"
	done < updateServer
rm updateServer
fi

#echo -e $Fok"$Fyellow $( basename $0 ) $Foff"

################### END
#cd $RETURN
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

