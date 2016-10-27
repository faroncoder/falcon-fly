#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
if [[ "$1" != "" ]]; then
#################### BEGIN

SEARCH=$@



npm search $SEARCH | jq '.[] |  .name '


################### END
#cd $RETURN 1> /dev/null;
else echo "$Fno $Fred Enter the keyword for npm search $Foff=$Fyellow$Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/handle/ff.handle.npm.search.sh [ACTIVE] y


