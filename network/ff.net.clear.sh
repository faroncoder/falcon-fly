#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
#################### BEGIN

GETSF=( `/usr/local/bin/ff.net.iface-all` )
for c in "${GETSF[@]}"; do
	if [[ "$c" == "lo" ]]; then
		echo -e "$Fstat ignoring $c"
	else
		$SUDO ifconfig $c 0.0.0.0 2> /dev/null;
		echo -e "$Fwarn $c cleared"
	fi
done

################### END
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y