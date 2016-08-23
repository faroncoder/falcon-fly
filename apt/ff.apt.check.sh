#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#if [[ "$1" != "" ]]; then
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
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstatus $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /usr/local/apt/ff.apt.check [ACTIVE] y

