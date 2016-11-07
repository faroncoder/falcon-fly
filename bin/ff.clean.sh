#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

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
echo "_ok cleaned!"


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.clean.sh  [ACTIVE] y

