#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

echo -e _info "Getting Meteor"
curl https://install.meteor.com/ | sh  1> /dev/null < /dev/null
echo -e _info "Meteor installed! "


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.setup.meteor.sh  [ACTIVE] y

