#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

echo -e $Finfo "Getting Meteor"
curl https://install.meteor.com/ | sh  1> /dev/null < /dev/null
echo -e $Finfo "Meteor installed! "


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.setup.meteor.sh  [ACTIVE] y

