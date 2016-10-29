#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
#if [[ "$1" != "" ]]; then
#################### BEGIN

echo -n "alias name? "
      read aliasesname
      echo -n "command for $aliasesname? "
      read aliascomm
queryalias="alias $aliasesname=\" $aliascomm \""
echo $queryalias >> /usr/local/lib/faron_falcon/alias

echo -e $Fok"$Fblue alias added! $Foff"

################### END
#cd $RETURN
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

