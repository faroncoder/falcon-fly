#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN

SLICEIP6=`ifconfig | awk NR==3 | awk '{print $3}' | cut -d '/' -f1 |  tr ':' '\n' | tail -n 2` 
ADR2=`echo $SLICEIP6 | cut -d" " -f2`
ADR1=`echo $SLICEIP6 | cut -d" " -f1`
ADD3=`echo ${ADR1:(2,2)}`
BASE="2001:470:1c:820:212:3fff:fe$ADD3:$ADR2"
echo $BASE

################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow name of package to check in dpkg$Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y




