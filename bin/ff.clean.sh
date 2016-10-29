#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 

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
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/bin/ff.clean.sh [ACTIVE] y


