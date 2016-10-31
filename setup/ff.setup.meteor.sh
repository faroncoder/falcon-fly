#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

echo -e $Finfo "Getting Meteor"
curl https://install.meteor.com/ | sh  1> /dev/null < /dev/null
echo -e $Finfo "Meteor installed! "


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.setup.meteor.sh  [ACTIVE] y

