#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

PICKS=( $@ )

for j in "${PICKS[@]}"; do

	CHECKDPKG=`dpkg-query --show --showformat='${db:Status-Status}' "$j" 2> /dev/null; `
	if [[ "$CHECKDPKG" == "installed" ]]; then
		echo -e "_ok$b_green $j installed.$clear"
	else
		echo -e "$_no$b_red $j is not installed.$clear"
	fi
	j=""
done

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.check.sh  [ACTIVE] y

