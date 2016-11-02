#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

$SUDO service apache2 restart

# echo -e "${_stat}"
# echo -e "${_no}"
# echo -e "${_warn}"
echo -e "${_info} mysql service restarted"
# echo -e "${_ok}"



################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.ser.mysql.sh  [ACTIVE] y

