#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

PICKS=( $@ )

for j in "${PICKS[@]}"; do
		source /usr/local/bin/ff.apt.build $j
		sudo apt-get install -y $j --force-yes 2> /dev/null;
		j=""
done




###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.fetch.sh  [ACTIVE] y

