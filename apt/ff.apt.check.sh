#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

PICKS=( $@ )

for j in "${PICKS[@]}"; do

	CHECKDPKG=`dpkg-query --show --showformat='${db:Status-Status}' "$j" 2> /dev/null; `
	if [[ "$CHECKDPKG" == "installed" ]]; then
		echo -e "$Fok$Fgreen $j installed.$Foff"
	else
		echo -e "$Fno$Fred $j is not installed.$Foff"
	fi
	j=""
done

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.check.sh  [ACTIVE] y

