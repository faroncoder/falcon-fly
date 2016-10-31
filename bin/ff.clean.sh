#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

IFLO="*.*~"
find $RETURN -maxdepth 1 -type f -name "$IFLO" -exec /bin/rm {} \;
IFLO=".*_*~"
find $RETURN -maxdepth 1 -type f -name "$IFLO" -exec /bin/rm {} \;
IFLO="*.sh~"
find $RETURN -maxdepth 1 -type f -name "$IFLO" -exec /bin/rm {} \;
IFLO="*~"
find $RETURN -maxdepth 1 -type f -name "$IFLO" -exec /bin/rm {} \;
IFLO="*.*save"
find $RETURN -maxdepth 1 -type f -name "$IFLO" -exec /bin/rm {} \;
IFLO=".*~ *.*save*~"
find $RETURN -maxdepth 1 -type f -name "$IFLO" -exec /bin/rm {} \;
echo "$Fok cleaned!"


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.clean.sh  [ACTIVE] y

