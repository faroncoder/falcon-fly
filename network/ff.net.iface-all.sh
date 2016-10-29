#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
#if [[ "$1" != "" ]]; then
#################### BEGIN


## Get the real interface name
#ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d' | head -n 1


## get all of interfaces (including virutuals)
ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d' 


################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstatus $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /usr/local/bin/ff.script.new  [ACTIVE] y

