#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  loadSudo;
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
#################### BEGIN
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##
if [[ "$1" != "" ]]; then
	echo -e -n "$Fstatus alias name ? ";
fi

if [[ "$2" != "" ]]; then
	echo -e -n "$Fstatus command ? ";
	read CMD
fi

#echo -e $Fok"$Fyellow $( basename $0 ) $Foff"

echo "alias $1 =\"$CMD\"" >> /mnt/falcon/scripts/bash/lib/alias
echo $Fok
source $HOME/.bashrc

################### END
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

